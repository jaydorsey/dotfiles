-- Based heavily on https://gitlab.com/Iron_E/dotfiles

-- This needs to load _really_ early or else it warns; just leave here for now
vim.cmd([[
  let g:polyglot_disabled = ['yard', 'typescript', 'jsx', 'tsx']
]])

require('packer_compiled')
--require('impatient')
vim.g.did_load_filetypes = 1

require('settings')
require('maps')
require('plugins')

-- Loads everything that I couldn't convert over to lua easily
vim.api.nvim_command 'runtime init/config.vim'
