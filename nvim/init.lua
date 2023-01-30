
config = os.getenv("XDG_CONFIG_HOME");
if (config == nil) then
  config = os.getenv("HOME") .. "/.config";
end

package.path = config .. '/nvim/configs/?.lua;' .. package.path
require("plugins");
require("lsp");
require("keys");
require("cosmetic");
require("completion");

