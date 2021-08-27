vim.cmd [[packadd packer.nvim]]

  require('settings')
  require('maps')
return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  use {'svermeulen/vimpeccable'}
  use {'AndrewRadev/splitjoin.vim'} -- Use shortcuts gJ and gS to join and split, respectively
  use {'Konfekt/FastFold'}
  use {'Pocco81/Catppuccino.nvim'}
  use {'Raimondi/delimitMate'} -- Add automatic delimiters ([<{, quotes, etc.
  use {'alfredodeza/jacinto.vim'} -- Formatting & validating json via :Jacinto
  use {'andymass/vim-matchup', event='VimEnter'} -- An improved matchit plugin with additional motions & matchers
  use {'bronson/vim-visual-star-search'}
  use {'editorconfig/editorconfig-Vim'}
  use {'gioele/vim-autoswap'} -- Better, automatic swap file management
  use {'guns/xterm-color-table.vim'}
  use {'haya14busa/vim-asterisk'} -- Improved * motions
  use {'inside/vim-search-pulse'}
  use {'jaydorsey/charblob'}
  use {'jaydorsey/fzf_float', branch=main}
  use {'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut'} -- Use :ToGithub to open the current line in your browser
  use {'jeetsukumaran/vim-markology'}
  use {'jgdavey/tslime.vim', branch=main} -- Send to tmux
  use {'junegunn/limelight.vim'} -- Highlight code blocks with :LimelightToggle
  use {'junegunn/vim-easy-align'}
  use {'junegunn/vim-peekaboo'} -- Extends " and @ in normal mode to auto-show registers
  use {'karb94/neoscroll.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'machakann/vim-sandwich'}
  use {'mbbill/undotree'}
  -- use {'mhinz/vim-startify'}
  use {'misterbuckley/vim-definitive'}
  use {'morhetz/gruvbox'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/completion-nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'rhysd/committia.vim'}
  use {'rrethy/vim-hexokinase', run='make hexakinase'}
  use {'tjdevries/colorbuddy.vim'}
  use {'tpope/vim-characterize'}
  use {'tpope/vim-dispatch'}
  use {'tpope/vim-eunuch'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rails'}
  use {'tpope/vim-repeat'}
  use {'unblevable/quick-scope'}
  use {'wincent/ferret'}
  use {'windwp/nvim-spectre'}
  use {'wsdjeg/vim-fetch'}
  use {'sheerun/vim-polyglot'}
  use {'APZelos/blamer.nvim'}
  use {'elzr/vim-json', ft={'json'}}
  use {'easymotion/vim-easymotion'}
  use {'tarekbecker/vim-yaml-formatter', ft={'yaml', 'yml'}}
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use {'junegunn/fzf.vim'}
  use {'kyazdani42/nvim-tree.lua'} -- NERDTree replacement. Use g? to open up help

  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'ethanholz/nvim-lastplace', branch=main, 
    config = function() require('nvim-lastplace').setup({
      lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
      lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
      lastplace_open_folds = true
    }) end
  } 

  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup({comment_empty = false}) end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('telescope').setup {
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
            ["<Esc>"] = require('telescope.actions').close,
            ["<C-c>"] = function()
            vim.cmd [[stopinsert]]
            end,
          },
        },
      },
    } end
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)



--require('galaxyline')

