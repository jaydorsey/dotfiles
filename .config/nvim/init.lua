-- Install packer, if not present
-- https://gitlab.com/Iron_E/dotfiles
require('settings')
require('maps')

vim.api.nvim_command 'runtime init/config.vim'

-- local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'

if not vim.loop.fs_stat(vim.fn.glob(install_path)) then
  os.execute('git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'} -- Packer can manage itself

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- use {
  --   'folke/trouble.nvim',
  --   wants='nvim-web-devicons',
  --   config = function() require('trouble').setup({auto_preview=false}) end
  -- }

  -- use {
  --   'folke/todo-comments.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  --   wants = 'trouble.nvim',
  --   config = function() require('todo-comments').setup({highlight = {keyword = 'bg'}}) end
  -- }

  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}

  use {
    'norcalli/nvim-colorizer.lua',
    event='VimEnter',
    config = function() require('colorizer').setup() end
  }
  -- map.n.nore.silent['<Leader>c'] = '<Cmd>ColorizerToggle<CR>'

  use {'vim-ruby/vim-ruby'}
  use {'ggandor/lightspeed.nvim', wants='vim-sandwich'} -- sneak
  use {'wellle/targets.vim'}

  -- Look at these
  -- use {'dstein64/vim-win', config=req 'win'}
  -- use {'liuchengxu/vista.vim', config=req 'vista'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        space_char_blankline = ' ',
        show_end_of_line = true,
        char_highlight_list = {
          'IndentBlanklineIndent1',
          'IndentBlanklineIndent2',
          'IndentBlanklineIndent3',
          'IndentBlanklineIndent4',
          'IndentBlanklineIndent5',
          'IndentBlanklineIndent6'
        }
      })
    end
  }

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
  -- use {'junegunn/vim-easy-align'}

  use {'tversteeg/registers.nvim'}
  -- use {'junegunn/vim-peekaboo'} -- Extends " and @ in normal mode to auto-show registers

  use {'karb94/neoscroll.nvim'}
  use {'kyazdani42/nvim-web-devicons'}

  use {'tpope/vim-surround'} -- vim-surround in lua
  use {'machakann/vim-sandwich'} -- dependency for something else
  -- use {
  --   'blackCauldron7/surround.nvim',
  --   config = function()
  --     require('surround').setup {}
  --   end
  -- }

  use {'mbbill/undotree'}
  -- use {'mhinz/vim-startify'}
  use {'misterbuckley/vim-definitive'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/completion-nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'rhysd/committia.vim'}
  -- use {'rrethy/vim-hexokinase', run='make hexakinase'}
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
  use {'kyazdani42/nvim-tree.lua', wants='nvim-web-devicons'} -- NERDTree replacement. Use g? to open up help

--  use {
--    'glepnir/galaxyline.nvim',
--    branch = 'main',
--    config = function() require('statusline') end,
--    requires = {'kyazdani42/nvim-web-devicons'}
--  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup({
    }) end
  }

  use {
    'ethanholz/nvim-lastplace',
    branch=main, 
    config = function() require('nvim-lastplace').setup({
      lastplace_ignore_buftype = {'quickfix', 'nofile', 'help'},
      lastplace_ignore_filetype = {'gitcommit', 'gitrebase', 'svn', 'hgcommit'},
      lastplace_open_folds = true
    }) end
  } 

  use {'tomtom/tcomment_vim'} -- comment with gc motions

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
            ['<Esc>'] = require('telescope.actions').close,
            ['<C-c>'] = function()
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
end)

--require('galaxyline')

