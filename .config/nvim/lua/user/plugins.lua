local fn = vim.fn

-- let g:ale_ruby_rubocop_options --server
vim.g.ale_ruby_rubocop_options = '--server'

-- print path where packer installs plugins. ~/.local/share/nvim
-- lua vim.api.nvim_echo({{vim.fn.stdpath('data')}}, false, {})
-- typically, $HOME/.local/share/nvim/site/pack/packer/

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  echo 'Installing packer. Close and reopen neovim'
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- don't throw any error on first use by packer
local ok, packer = pcall(require, 'packer')

if not ok then
  vim.notify('Error loading plugins.lua\n\n' .. packer)
  return
end

packer.init {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
  log = { level = 'error' }, -- or 'trace'
  max_jobs=50,
}

return packer.startup(
  function(use)
    use 'wbthomason/packer.nvim' -- Use packer to manage itself
    use 'lewis6991/impatient.nvim' -- Improve startup time for nvim
    -- use 'nathom/filetype.nvim' -- faster filetype.vim
    use 'kyazdani42/nvim-web-devicons'
    use 'windwp/nvim-autopairs'
    use 'catppuccin/nvim' -- colorscheme

    use {
      'github/copilot.vim',
      branch = 'release',
      ft = {
        'ruby'
      }
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
        -- 'p00f/nvim-ts-rainbow'
      },
      run = ':TSUpdate',
    }

    -- use {
    --   'autozimu/LanguageClient-neovim',
    --   branch = 'next',
    --   run = 'bash install.sh'
    -- }
    use {
      'christoomey/vim-sort-motion'
    }

    use {
      'francoiscabrol/ranger.vim',
      requires = {
        'rbgrouleff/bclose.vim'
      }
    }

    use {
      'RRethy/nvim-treesitter-textsubjects',
      after = 'nvim-treesitter'
    }
    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter'
    }
    use {
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
      after = 'nvim-treesitter'
    }
    use {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim'
    }
    use 'norcalli/nvim-colorizer.lua' -- colorize hex/rgb codes like #ff0000

    use { -- ruby syntax and helpers
      'vim-ruby/vim-ruby',
      ft = {
        'ruby',
        'erb'
      },
    }

    use 'wellle/targets.vim'
    use 'axelf4/vim-strip-trailing-whitespace'
    use 'lukas-reineke/indent-blankline.nvim'

    use 'dstein64/vim-startuptime' -- Measure startup time with :StartupTime
    use 'AndrewRadev/splitjoin.vim' -- Use shortcuts gJ and gS to join and split, respectively
    use 'Konfekt/FastFold'
    use 'Raimondi/delimitMate' -- Add automatic delimiters ([<{, quotes, etc.
    use { -- Formatting & validating json via :Jacinto
      'alfredodeza/jacinto.vim',
      ft = {'json'},
    }
    use 'bronson/vim-visual-star-search'
    use 'editorconfig/editorconfig-Vim'
    use 'gioele/vim-autoswap' -- Better, automatic swap file management
    use 'guns/xterm-color-table.vim'
    use 'haya14busa/vim-asterisk' -- Improved * motions
    use 'inside/vim-search-pulse'

    use {
      'jaydorsey/vim-to-github',
      branch='jay/add_blame_shortcut'
    }

    use {
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('gitlinker').setup()
      end
    }

    -- Bookmarking plugin, might replace markology
    -- mm to create bookmark
    -- mi to bookmark & annotate
    -- ma to show all bookmarks
    use  'MattesGroeger/vim-bookmarks'

    use { -- Send to tmux
      'jgdavey/tslime.vim',
      branch=main
    }
    use 'junegunn/limelight.vim' -- Highlight code blocks with :LimelightToggle
    use 'junegunn/vim-easy-align' -- Align code
    use 'edluffy/specs.nvim' -- Cursor beacon across huge jumps
    use 'tversteeg/registers.nvim'
    use 'karb94/neoscroll.nvim' -- Smooth scrolling plugin

    -- use 'tpope/vim-surround'
    -- surround; sa/sd/sr for add/delete/replace
    use {
      'machakann/vim-sandwich',
      {
        'andymass/vim-matchup',
        setup = [[require('matchup')]],
        event = 'User ActuallyEditing'
      }
    }

    use 'mbbill/undotree'
    use 'mhinz/vim-startify'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'rhysd/committia.vim'
    use 'tpope/vim-characterize'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rails'
    use 'tpope/vim-repeat'
    use 'wincent/ferret' -- Enhanced multi file search
    use 'windwp/nvim-spectre' -- Regex search & replace
    use 'wsdjeg/vim-fetch'
    use 'sheerun/vim-polyglot'
    use 'APZelos/blamer.nvim'
    use {
      'elzr/vim-json',
      ft={
        'json'
      }
    }
    use 'easymotion/vim-easymotion'
    use {
      'tarekbecker/vim-yaml-formatter',
      ft={
        'yaml',
        'yml'
      }
    }
    -- This is also used by zsh
    use {
      'junegunn/fzf',
      dir = '~/.fzf',
      run = './install --all'
    }
    use 'junegunn/fzf.vim'

    use { -- NERDTree replacement. Use g? to open up help
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      }
    }
    use { -- fast status line plugin written in vim
      'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons', opt = true
      },
    }
    use 'romgrk/barbar.nvim' -- Tabline plugin with different features

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      event = 'BufRead'
    }

    use {
      'ethanholz/nvim-lastplace',
      branch=main
    }

    use 'numToStr/Comment.nvim' -- Comment plugin, in lua

    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    use 'folke/which-key.nvim'

    -- use {
    --   'nvim-telescope/telescope.nvim',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --     'nvim-telescope/telescope-fzy-native.nvim',
    --     { 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
    --   }
    -- }

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
      'dense-analysis/ale',
      ft = {
        'sh',
        'zsh',
        'markdown',
        'ruby',
        'yml'
      },
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable]]'
    }

    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end
)
