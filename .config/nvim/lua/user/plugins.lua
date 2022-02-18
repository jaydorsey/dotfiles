local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')

if not status_ok then
  vim.notify('Error loading user/plugins.lua\n\n' .. packer)
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
  max_jobs=50
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  -- use 'goolord/alpha-nvim'
  use {'mhinz/vim-startify'}
  use 'antoinemadec/FixCursorHold.nvim' -- This is needed to fix lsp doc highlight
  use 'folke/which-key.nvim'
  use { 'ethanholz/nvim-lastplace', branch=main }
  use 'Konfekt/FastFold'
  use { 'alfredodeza/jacinto.vim', ft = { 'json' } } -- Formatting & validating json via :Jacinto
  use 'bronson/vim-visual-star-search'
  use 'editorconfig/editorconfig-Vim'
  use 'gioele/vim-autoswap' -- Better, automatic swap file management
  use 'guns/xterm-color-table.vim'
  -- Improved * motions
  use 'haya14busa/vim-asterisk'
  use 'inside/vim-search-pulse'

  -- Bookmarking plugin, replaces markology
  -- mm to create bookmark
  -- mi to bookmark & annotate
  -- ma to show all bookmarks
  use 'MattesGroeger/vim-bookmarks'

  use { 'jgdavey/tslime.vim', branch=main} -- Send to tmux
  use 'junegunn/limelight.vim' -- Highlight code blocks with :LimelightToggle
  use 'junegunn/vim-easy-align' -- Align code
  use 'tversteeg/registers.nvim'
  use 'edluffy/specs.nvim' -- Cursor beacon across huge jumps

  -- Colorscheme
  use {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup(
          {
          transparent_background = false,
          term_colors = false,
          styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
          },
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
              },
              underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
              },
            },
            lsp_trouble = false,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = false,
            telescope = true,
            nvimtree = {
              enabled = true,
              show_root = false,
            },
            which_key = false,
            indent_blankline = {
              enabled = true,
              colored_indent_levels = false,
            },
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = true,
            bufferline = false,
            markdown = false,
            lightspeed = false,
            ts_rainbow = false,
            hop = false,
          },
        }
      )
    end
  }

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  --use 'saadparwaiz1/cmp_luasnip' -- snippet completions

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use { 'github/copilot.vim', branch = 'release', ft = {'ruby'} }
  -- Maybe can delete these
  -- use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
  -- use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
  -- use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' }
  -- use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }


  -- Git
  use 'lewis6991/gitsigns.nvim'
  use { 'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut' }


  use 'dstein64/vim-startuptime' -- Measure startup time with :StartupTime

  -- Random stuff from my other profile
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event='VimEnter',
    config = function() require('colorizer').setup() end
  }

  use { 'vim-ruby/vim-ruby', ft = { 'ruby', 'erb' } }
  use 'wellle/targets.vim'
  use 'axelf4/vim-strip-trailing-whitespace'
  use 'AndrewRadev/splitjoin.vim' -- Use shortcuts gJ and gS to join and split, respectively
  -- use 'Raimondi/delimitMate' -- Add automatic delimiters ([<{, quotes, etc.

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  }

  use {
    'karb94/neoscroll.nvim',
    config = function() require('neoscroll').setup() end
  }

  use 'tpope/vim-surround' -- vim-surround in lua
  use {
    'machakann/vim-sandwich',
    {
      'andymass/vim-matchup',
      setup = [[require('matchup')]],
      event = 'User ActuallyEditing'
    }
  }

  use 'mbbill/undotree'

  use 'misterbuckley/vim-definitive'
  -- use {'nvim-lua/completion-nvim'}
  use 'nvim-lua/popup.nvim'
  use 'rhysd/committia.vim'
  -- use {'rrethy/vim-hexokinase', run='make hexakinase'}
  use 'tpope/vim-characterize'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'wincent/ferret'
  -- Regex search & replace
  -- use {'windwp/nvim-spectre'}
  use 'wsdjeg/vim-fetch'
  use 'sheerun/vim-polyglot'
  use 'APZelos/blamer.nvim'
  use {'elzr/vim-json', ft={'json'}}
  use 'easymotion/vim-easymotion'
  use {'tarekbecker/vim-yaml-formatter', ft={'yaml', 'yml'}}
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'

  -- NERDTree replacement. Use g? to open up help
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }

  -- Statusline plugin written in vim
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Tabline plugin with different features
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  vim.g.bufferline = {
    tabpages = true,
    insert_at_end = true
  }

  -- Tabline plugin to show buffers, files, etc.
  -- use { 'kdheepak/tabline.nvim',
  --   config = function()
  --     require'tabline'.setup {
  --       enable = true,
  --       options = {
  --         section_separators = {'', ''},
  --         component_separators = {'', ''},
  --         max_bufferline_percent = 66,
  --         show_tabs_always = true,
  --         show_devicons = true,
  --         show_bufnr = false,
  --         show_filename_only = true,
  --       }
  --     }
  --     vim.cmd [[
  --       set guioptions-=e
  --       set sessionoptions+=tabpages,globals
  --     ]]
  --   end,
  --   requires = { {'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true} }
  -- }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'markdown', 'ruby', 'yml'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
