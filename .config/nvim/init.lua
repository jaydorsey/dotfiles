-- References:
-- https://gitlab.com/Iron_E/dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch
require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.impatient'
require 'user.colorscheme'
require 'user.catppuccin'
require 'user.gitsigns'
require 'user.specs'
require 'user.nvim-lastplace'
require 'user.nvim-autopairs'
require 'user.todo-comments'
require 'user.comment'
require 'user.which-key'
-- require 'user.telescope'
require 'user.indent-blankline'
require 'user.barbar'
require 'user.neoscroll'
require 'user.nvim-tree'
require 'user.lualine'
require 'user.nvim-colorizer'

-- require 'packer_compiled'
vim.g.did_load_filetypes = 1

-- Loads everything that I couldn't convert over to lua easily
vim.api.nvim_command 'runtime init/config.vim'
