-- References:
-- https://gitlab.com/Iron_E/dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://dotfyle.com/

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.ruby_default_path = '~/.local/share/rtx/shims/ruby'
vim.g.ruby_host_prog = '~/.local/share/rtx/shims/neovim-ruby-host'
vim.g.ruby_path = '~/.local/share/rtx/shims/ruby'

vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

vim.g.mapleader = ' '
-- vim.cmd([[colorscheme gruvbox]])

require('lazy').setup('user.plugins', {
    defaults = { lazy = true },
    -- change_detection = { notify = false },
    performance = {
      cache = { enabled = true },
    },
  }
)

require 'user.options'
require 'user.keymaps'
require 'user.commands'

vim.api.nvim_set_hl(0, 'Comment', { fg = '#9E9E9E' })
