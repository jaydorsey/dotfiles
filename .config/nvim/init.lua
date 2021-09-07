-- Based heavily on https://gitlab.com/Iron_E/dotfiles
require('settings')
require('maps')
require('plugins')

-- Loads everything that I couldn't convert over to lua easily
vim.api.nvim_command 'runtime init/config.vim'
