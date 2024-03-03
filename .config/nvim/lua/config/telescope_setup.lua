local map = vim.api.nvim_set_keymap

local function files_fallback()
  vim.fn.system 'git rev-parse --is-inside-work-tree'
  local dropdown = require('telescope.themes').get_dropdown()
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files(dropdown)
  else
    require('telescope.builtin').find_files(dropdown)
  end
end
