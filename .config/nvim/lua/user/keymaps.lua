vim.g.mapleader = " "
vim.g.localleader = "\\"

-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

-- This is needed for maps that call <Plug>
-- https://neovim.discourse.group/t/unable-to-make-plug-calls/402/4
options        = { noremap = true } -- map('n', '<leader><esc>', ':nohlsearch<cr>', options)
plug_options   = { silent = true }
silent_options = { noremap = true, silent = true } -- map('n', '<leader><esc>', ':nohlsearch<cr>', options)

-- map('n', '<leader>e', ':Neotree toggle<cr>', options)

-- navigate with ctrl-n/ctrl-b across buffers
map('n', '<c-n>', ':bnext<cr>', options)
map('n', '<c-h>', ':bprev<cr>', options)

-- yank into the system clipboard
map('v', '<leader>y', '"+y', options)

-- Find definition for currently highlighted word
map('n', '<c-\\>', '<c-2><c-]><c-w>T', options)

-- Change the local window current directory to that of current file
map('n', '<leader>cd', 'lcd %:p:h', options)

-- Automatically re-select the visually selected text. Disabled, because it works fine without it. You can just use
-- gv when you need to reselect
-- https://superuser.com/a/207521/354661
-- map('v', '<', '<gv^', options)
-- map('v', '>', '>gv^', options)

-- Automatically highlight the pasted text
-- https://stackoverflow.com/a/4313335/2892779
map('n', '<c-p>', "p`[v`]", options)

-- Use Q as a default macro. This lets you quickly create a macro with qq & replay it back with Q
map('n', 'Q', '@q', options)

-- clear search highlighting
map('n', '//', ':noh<cr>', options)
-- map('n', '<esc><esc>', ':noh<cr>', options)

-- put relative path in clipboard
map('n', ',cs', ':let @*=expand("%:.")<cr>', options)
-- put absolute path in clipboard
map('n', ',cl', ':let @*=expand("%:p")<cr>', options)

-- vim.g.vim_search_pulse_disable_auto_mappings = 1
--
-- map('n', '*', '<Plug>(asterisk-z*)<Plug>Pulse', plug_options)
-- map('n', '#', '<Plug>(asterisk-z#)<Plug>Pulse', plug_options)
-- map('n', 'n', 'n<Plug>Pulse', plug_options)
-- map('n', 'N', 'N<Plug>Pulse', plug_options)

map('n', '<leader>l', ':Limelight!!<cr>', options)
map('x', '<leader>l', ':Limelight!!<cr>', options)
map('n', '<leader>ob', ':BufferOrderByBufferNumber<CR>', options) -- Order Buffers

map('n', '<leader>p', ":lua Snacks.picker.smart({ hidden = true })<cr>", silent_options)
map('n', '<c-g>', ":lua Snacks.picker.grep()<cr>", silent_options)

map('n', 'J', 'mzJ`z', options) -- Keep the cursor in place while joining lines

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

-- renamer.nvim
map('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- cshuaimin/ssr.nvim
-- map({'n', 'x'}, '<leader>sr', function() require('ssr').open() end)

-- hlslens & asterisk
map('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
map('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
map('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
map('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})
map('x', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
map('x', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
map('x', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
map('x', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

map('n', '<leader>b', ':BlameToggle window<cr>', silentoptions)
