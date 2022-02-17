-- References:
-- https://gitlab.com/Iron_E/dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch

require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.colorscheme'
require 'user.cmp'
require 'user.lsp'
require 'user.telescope'
require 'user.treesitter'

-- This needs to load _really_ early or else it warns; just leave here for now
vim.cmd([[
  let g:polyglot_disabled = ['yard', 'typescript', 'jsx', 'tsx']
]])

require 'settings'
-- require 'plugins'

-- Loads everything that I couldn't convert over to lua easily
vim.api.nvim_command 'runtime init/config.vim'
