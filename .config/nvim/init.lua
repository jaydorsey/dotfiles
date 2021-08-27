vim.cmd 'packadd paq-nvim'

require('settings')
require('maps')
--require('galaxyline')

local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}

paq {'svermeulen/vimpeccable'}

-- Note that we are using 'vimp' (not 'vim') below to add the maps
-- vimp is shorthand for vimpeccable
local vimp = require('vimp')

paq {'savq/paq-nvim', opt = true}

paq {'AndrewRadev/splitjoin.vim'} -- Use shortcuts gJ and gS to join and split, respectively
paq {'Konfekt/FastFold'}
paq {'Pocco81/Catppuccino.nvim'}
paq {'Raimondi/delimitMate'} -- Add automatic delimiters ([<{, quotes, etc.
paq {'alfredodeza/jacinto.vim'} -- Formatting & validating json via :Jacinto
paq {'andymass/vim-matchup'} -- An improved matchit plugin with additional motions & matchers
paq {'bronson/vim-visual-star-search'}
paq {'editorconfig/editorconfig-Vim'}
paq {'gioele/vim-autoswap'} -- Better, automatic swap file management
paq {'glepnir/galaxyline.nvim', branch=main}
paq {'guns/xterm-color-table.vim'}
paq {'haya14busa/vim-asterisk'} -- Improved * motions
paq {'inside/vim-search-pulse'}
paq {'jaydorsey/charblob'}
paq {'jaydorsey/fzf_float', branch=main}
paq {'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut'} -- Use :ToGithub to open the current line in your browser
paq {'jeetsukumaran/vim-markology'}
paq {'jgdavey/tslime.vim', branch=main} -- Send to tmux
paq {'junegunn/limelight.vim'} -- Highlight code blocks with :LimelightToggle
paq {'junegunn/vim-easy-align'}
paq {'junegunn/vim-peekaboo'} -- Extends " and @ in normal mode to auto-show registers
paq {'karb94/neoscroll.nvim'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'machakann/vim-sandwich'}
paq {'mbbill/undotree'}
paq {'mhinz/vim-startify'}
paq {'misterbuckley/vim-definitive'}
paq {'morhetz/gruvbox'}
paq {'neovim/nvim-lspconfig'}
paq {'nvim-lua/completion-nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'rhysd/committia.vim'}
paq {'rrethy/vim-hexokinase', run='make hexakinase'}
paq {'tjdevries/colorbuddy.vim'}
paq {'tpope/vim-characterize'}
paq {'tpope/vim-dispatch'}
paq {'tpope/vim-eunuch'}
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-rails'}
paq {'tpope/vim-repeat'}
paq {'unblevable/quick-scope'}
paq {'wincent/ferret'}
paq {'windwp/nvim-spectre'}
paq {'wsdjeg/vim-fetch'}
paq {'sheerun/vim-polyglot'}
paq {'APZelos/blamer.nvim'}
paq {'elzr/vim-json'}
paq {'easymotion/vim-easymotion'}
paq {'tarekbecker/vim-yaml-formatter'}
paq {'junegunn/fzf', run='fzf#install'}
paq {'junegunn/fzf.vim'}

paq {'lewis6991/gitsigns.nvim'}
require('gitsigns').setup()

paq {'ethanholz/nvim-lastplace', branch=main} 
require('nvim-lastplace').setup {
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
}

-- NERDTree replacement. Use g? to open up help
paq {'kyazdani42/nvim-tree.lua'}

paq {'terrortylor/nvim-comment'}
require('nvim_comment').setup({comment_empty = false})

paq {'nvim-telescope/telescope.nvim'}

local actions = require('telescope.actions')

require('telescope').setup {
  config = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  },
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-c>"] = function()
        vim.cmd [[stopinsert]]
        end,
      },
    },
  },
}


vimp.nnoremap('<leader>p', function()
	require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '--follow', '--glob=!.git'} })
end)

vimp.nnoremap('<leader>b', function()
  require('telescope.builtin').buffers()
end)
-- nnoremap <silent><leader>b :lua require 'telescope.builtin'.buffers()<cr>


vimp.nnoremap('<leader>hw', function()
  print('hello000')
  print('world')
end)

-- Toggle line numbers
vimp.nnoremap('<leader>n', function()
  vim.wo.number = not vim.wo.number
end)

-- Keep the cursor in place while joining lines
vimp.nnoremap('J', 'mzJ`z')

vimp.nnoremap('<leader>vv', function()
  vim.cmd('e ~/.config/nvim/init.lua')
end)

-- r = reload vimrc
vimp.nnoremap('<leader>rr', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("config.util").unload_lua_namespace('config')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded vimrc!")
end)

vim.cmd('colorscheme catppuccino')

-- vim.o.background=dark -- Always use colors for dark color schemes
