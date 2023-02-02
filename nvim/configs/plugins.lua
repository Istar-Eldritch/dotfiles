local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Stats
  use 'wakatime/vim-wakatime' -- https://wakatime.com/vim
  use 'vimsence/vimsence' --Integration with discord

  -- Navigation
  use 'scrooloose/nerdtree'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1'
  }

  use 'tyru/open-browser.vim'
  use 'tyru/open-browser-github.vim'

  use 'MattesGroeger/vim-bookmarks'

  -- Cosmetic

  use 'Yggdroot/indentLine' -- Show indentation characters
  use 'nvim-treesitter/nvim-treesitter'

  -- Coding tools

  use 'neovim/nvim-lspconfig'

  use 'airblade/vim-gitgutter' -- Shows +/- on the editor based on g diff HEAD^
  use 'Xuyuanp/nerdtree-git-plugin' -- Show git status in nerd-tree
  use 'tpope/vim-fugitive' -- git extensions and commands

  use 'mfussenegger/nvim-dap' -- debug adapter

  use 'rktjmp/lush.nvim' -- Theme creation

  -- Languages and syntax support
  use 'elzr/vim-json'
  use 'plasticboy/vim-markdown'
  use 'hashivim/vim-terraform'

  -- autocomplete
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'

  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
