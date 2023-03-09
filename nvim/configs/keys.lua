local function nmap(k, cmd) vim.api.nvim_set_keymap('n', k, cmd, { noremap = true }) end

local function vmap(k, cmd) vim.api.nvim_set_keymap('v', k, cmd, { noremap = true }) end

nmap('<leader>n', '<cmd>NERDTreeToggle<CR>');

-- Telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>');
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>');
nmap('<leader>fb', '<cmd>Telescope buffers<cr>');
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>');
nmap('<ESC>', '<cmd>noh<cr>');

nmap('<leader>rq', '<Plug>RestNvim');

vmap('<leader>ga', '<cmd>OpenAIChatGPT<cr>');
