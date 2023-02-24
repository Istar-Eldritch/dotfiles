local nvim_lsp = require('lspconfig')

local pid = vim.fn.getpid()

-- Mapping opts
local opts = { noremap=true, silent=true }

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Navigation
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>fh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>fH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Telescope bindings
  buf_set_keymap('n', '<leader>fsw', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
  buf_set_keymap('n', '<leader>fsW', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
  buf_set_keymap('n', '<leader>fsd', '<cmd>Telescope lsp_document_symbols<CR>', opts)
  buf_set_keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '<leader>fd', '<cmd>Telescope lsp_definitions<CR>', opts)

  buf_set_keymap('n', '<leader>fi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', '<leader>ft', '<cmd>Telescope lsp_type_definitions<CR>', opts)
  buf_set_keymap('n', '<leader>fci', '<cmd>Telescope lsp_incoming_calls<CR>', opts)
  buf_set_keymap('n', '<leader>fco', '<cmd>Telescope lsp_outgoin_calls<CR>', opts)
  buf_set_keymap('n', '<leader>fD', '<cmd>lua require(\'telescope.builtin\').diagnostics()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>dq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

end

nvim_lsp.pyright.setup { on_attach = on_attach }
nvim_lsp.rust_analyzer.setup { on_attach = on_attach, settings = {
  ["rust-analyzer"] = {
    diagnostics = {
      disabled = { "inactive-code" }
    }
  }
} }
nvim_lsp.tsserver.setup { on_attach = on_attach }
nvim_lsp.lua_ls.setup { on_attach = on_attach }
nvim_lsp.marksman.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_command([[setlocal textwidth=120 formatoptions+=t]])
  end
}
nvim_lsp.omnisharp.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr);
      -- cs requires this patch to work with assembly files
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fd', '<cmd>lua require(\'omnisharp_extended\').telescope_lsp_definitions()<CR>', opts)
    end,
    handlers = {
      ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) }
}

