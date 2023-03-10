local http = require 'plenary.curl'

local token = os.getenv('OPENAI_TOKEN')

if not token then
  token = ''
end

local headers = {
  content_type = 'application/json',
  authorization = 'Bearer ' .. token
}

local function pprint(t, i, acc)
  if not acc then
    acc = ''
  end

  i = i or 0
  for k, v in pairs(t) do
    local indent = string.rep(" ", i)
    if type(v) == "table" then
      acc = acc .. indent .. tostring(k) .. " = {"
      acc = pprint(v, i + 2, acc)
      acc = acc .. indent .. "}"
    else
      acc = acc .. indent .. tostring(k) .. " = " .. tostring(v)
    end
  end
  return acc
end

local function visual_selection_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  if csrow < cerow or (csrow == cerow and cscol <= cecol) then
    return csrow - 1, cscol - 1, cerow - 1, cecol
  else
    return cerow - 1, cecol - 1, csrow - 1, cscol
  end
end

local function get_text_in_range()
  local start_row, start_col, end_row, end_col = visual_selection_range()
  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
  if #lines == 1 then
    return string.sub(lines[1], start_col + 1, end_col)
  else
    lines[1] = string.sub(lines[1], start_col + 1, -1)
    lines[#lines] = string.sub(lines[#lines], 0, end_col - 1)
    return table.concat(lines, "\n")
  end
end

local messages = {}

local function clear_ctx()
  messages = {}
  print('Cleared ChatGPT context')
end

local function autocomplete_selection()
  -- Get the current buffer number
  local bufnr = vim.api.nvim_get_current_buf()

  local _, _, end_row, _ = visual_selection_range()
  local selection = get_text_in_range()

  table.insert(messages, {
    role = 'user',
    content = selection
  })

  local data = {
    model = 'gpt-3.5-turbo',
    messages = messages
  }

  local bufname = vim.api.nvim_buf_get_name(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'readonly', true)
  vim.api.nvim_buf_set_name(bufnr, '[RO] ' .. bufname)


  print('Doing OpenAI request')
  http.post('https://api.openai.com/v1/chat/completions', {
    headers = headers,
    body = vim.json.encode(data),
    callback = function(response, err)
      vim.defer_fn(function()
        vim.api.nvim_buf_set_option(bufnr, 'readonly', false)
        vim.api.nvim_buf_set_name(bufnr, bufname)

        local body = vim.json.decode(response.body)
        if response.status == 200 then
          local lines_to_add = { '' }
          local str = body.choices[1].message.content

          table.insert(messages, {
            role = 'assistant',
            content = str
          })

          for s in str:gmatch("[^\r\n]+") do
            table.insert(lines_to_add, s)
          end
          table.insert(lines_to_add, '')
          vim.api.nvim_buf_set_lines(bufnr, end_row + 1, end_row + 1, false, lines_to_add)
        else
          local error = 'Unparsed error'
          if response then
            if body then
              error = pprint(body);
            else
              error = pprint(response)
            end
          else
            error = pprint(err)
          end
          vim.api.nvim_err_writeln(error)
        end
        print('Done')
      end, 0)
    end
  })
end

vim.cmd([[command! -range=% OpenAIChatGPTRun lua require('openai').autocomplete_selection()]])
vim.cmd([[command OpenAIChatGPTCls lua require('openai').clear_ctx()]])

local exports = {
  autocomplete_selection = autocomplete_selection,
  clear_ctx = clear_ctx
}

return exports
