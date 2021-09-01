local g = vim.g

g.mapleader = " "

local map = vim.api.nvim_set_keymap

options = { noremap = true } -- map('n', '<leader><esc>', ':nohlsearch<cr>', options)

map('n', '<leader>e', ':NvimTreeToggle<cr>', options)
map('n', '<leader>r', ':NvimTreeRefresh<cr>', options)
map('n', '<leader>f', ':NvimTreeFindFile<cr>', options)

-- navigate with ctrl-n/ctrl-b across buffers
map('n', '<c-n>', ':bnext<cr>', options)
map('n', '<c-h>', ':bprev<cr>', options)

-- yank into the system clipboard
map('v', '<leader>y', '"+y', options)

-- vim-definitive
map('n', '<c-\\>', ':FindDefinition<cr>', options)
map('v', '<c-\\>', 'ay:FindDefinition<c-r>a<cr>', options)

-- Change the local window current directory to that of current file
map('n', '<leader>cd', 'lcd %:p:h', options)

-- Automatically re-select the visually selected text
-- https://superuser.com/a/207521/354661
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- Automatically highlight the pasted text
-- https://stackoverflow.com/a/4313335/2892779
map('n', '<c-p>', "p`[v`]", options)

-- Use Q as a default macro. This lets you quickly create a macro with qq & replay it back with Q
map('n', 'Q', '@q', options)

-- clear search highlighting
map('n', '//', ':noh<cr>', options)
map('n', '<esc><esc>', ':noh<cr>', options)

-- put relative path in clipboard
map('n', ',cs', ':let @*=expand("%")<cr>', options)
-- put absolute path in clipboard
map('n', ',cl', ':let @*=expand("%:p")<cr>', options)

map('n', '*', '<Plug>(asterisk-z*)<Plug>Pulse', options)
map('n', '#', '<Plug>(asterisk-z#)<Plug>Pulse', options)
map('n', 'n', 'n<Plug>Pulse', options)
map('n', 'N', 'N<Plug>Pulse', options)

map('n', '<leader>l', '<Plug>(Limelight)', options)
map('x', '<leader>l', '<Plug>(Limelight)', options)

map('n', '<leader>p', ":lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '--follow', '--glob=!.git'} })<cr>", options)
-- map('n', '<leader>p', ':Telescope find_files<cr>', options)

map('n', '<leader>b', ":lua require('telescope.builtin').buffers()", options)

-- Keep the cursor in place while joining lines
map('n', 'J', 'mzJ`z', options)

map('n', 'K', ':Find<cr>', options)

-- nnoremap K :Find<cr>

-- vimp.nnoremap('<leader>vv', function()
--   vim.cmd('e ~/.config/nvim/init.lua')
-- end)

-- " Jump to anywhere you want with minimal keystrokes, with just one key binding.
-- " `s{char}{label}`
-- nmap <leader>s <Plug>(easymotion-overwin-f)
-- nmap <leader>w <Plug>(easymotion-w)
-- " Turn on case-insensitive feature
-- let g:EasyMotion_smartcase = 1
-- " JK motions: Line motions
-- map <leader>j <Plug>(easymotion-j)
-- map <leader>k <Plug>(easymotion-k)

-- To save a macro and define it here, record the macro as normal, then
-- paste it in normal mode using "qp (assuming you used the q register)
-- https://stackoverflow.com/a/2024537/2892779

-- Convert variable assignment to let syntax
map('n', '@l', ':DelimitMateOff<cr><esc>^ilet(:<esc>ea)<esc>llxxi{ <esc>$a }<esc>:DelimitMateOn<cr>', options)

-- Change Rails.logger.info calls to use a block
map('n', '@i', ':DelimitMateOff<cr><esc>^xxxiRails.logger.info(<esc>$a)<esc>:DelimitMateOn<cr>', options)

-- Add a frozen string literal comment to the top of a file
map('n', '@f', 'gg0i<cr><cr><esc>kki# frozen_string_literal: true<esc>``', options)

-- vim-signature set next mark
map('n', 'mm', 'm,', options)
-- vim-signature jump to next mark
map('n', 'M', ']`', options)
