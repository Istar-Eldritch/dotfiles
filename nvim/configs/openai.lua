local http = require 'plenary.curl'

local token = os.getenv('OPENAI_TOKEN')

if not token then
  token = ''
end

local headers = {
  content_type = 'application/json',
  authorization = 'Bearer ' .. token
}

local function pprint(t, i)
  i = i or 0
  for k, v in pairs(t) do
    local indent = string.rep(" ", i)
    if type(v) == "table" then
      print(indent .. tostring(k) .. " = {")
      pprint(v, i + 2)
      print(indent .. "}")
    else
      print(indent .. tostring(k) .. " = " .. tostring(v))
    end
  end
end

local function autocomplete_selection()

  -- Get the current buffer number
  local bufnr = vim.api.nvim_get_current_buf()

  local start = vim.fn.line("'<") - 1
  local final = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(bufnr, start, final, false)
  local selection = table.concat(lines, "\n")

  local data = {
    model = 'gpt-3.5-turbo',
    messages = {
      { role = 'system',
        content = 'You provide truthful answers to questions. If unsure, you will reply with "I\'m not confident on my answer"'
      },
      { role = 'user',
        content = selection
      }
    }
  }

  local bufname = vim.api.nvim_buf_get_name(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'readonly', true)
  vim.api.nvim_buf_set_name(bufnr, '[RO] ' .. bufname)


  print('Doing OpenAI request')
  http.post('https://api.openai.com/v1/chat/completions', {
    headers = headers,
    body = vim.json.encode(data),
    callback = function(response)
      vim.defer_fn(function()
        vim.api.nvim_buf_set_option(bufnr, 'readonly', false)
        vim.api.nvim_buf_set_name(bufnr, bufname)

        local body = vim.json.decode(response.body)
        if response.status == 200 then
          local lines_to_add = { '' }
          local str = body.choices[1].message.content
          for s in str:gmatch("[^\r\n]+") do
            table.insert(lines_to_add, s)
          end
          table.insert(lines_to_add, '')
          vim.api.nvim_buf_set_text(bufnr, final, 0, final, 0, lines_to_add)
        else
          vim.api.nvim_err_writeln(pprint(body))
        end

        print('Done')
      end, 0)
    end
  })

end

vim.cmd([[command! -range=% OpenAIChatGPT lua require('openai').autocomplete_selection()]])

local exports = {
  autocomplete_selection = autocomplete_selection
}

return exports
