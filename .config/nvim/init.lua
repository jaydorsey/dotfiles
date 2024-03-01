-- References:
-- https://gitlab.com/Iron_E/dotfiles
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://dotfyle.com/

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.g.mapleader = ' '

require('lazy').setup('user.plugins', {
    defaults = { lazy = true },
    performance = {
      cache = { enabled = true },
    },
  }
)

require 'user.options'
require 'user.keymaps'
-- require 'user.plugins'
require 'user.commands'
require 'user.nvim-lastplace'
require 'user.nvim-autopairs'
require 'user.todo-comments'
require 'user.comment'
require 'user.indent-blankline'
require 'user.neoscroll'
require 'user.nvim-tree'
require 'user.nvim-colorizer'
