-- Quickfix keymaps

-- For quickfix windows, use 'o' to open a window and move back to the quickfix
vim.api.nvim_buf_set_keymap(0, 'n', 'o', '<cr><c-w>p', { noremap = true })
