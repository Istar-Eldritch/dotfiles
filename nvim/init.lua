local config = os.getenv("XDG_CONFIG_HOME");
if (config == nil) then
  config = os.getenv("HOME") .. "/.config";
end

package.path = config .. '/nvim/configs/?.lua;' .. package.path

-- Encrypted files default recipients
vim.cmd [[
  let g:GPGDefaultRecipients = [ "me@ruben.io" ]
]]

require("plugins");
require("lsp");
require("keys");
require("completion");

vim.opt.encoding = "utf-8";
-- show existing tab with 2 spaces width
vim.opt.tabstop = 2;
-- when identing with '>', use 2 spaces
vim.opt.shiftwidth = 2
-- On pressing tab, insert 2 spaces
vim.o.expandtab = true;

require("cosmetic");
require('lush')(require('theme'))

require('openai');
