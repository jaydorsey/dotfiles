local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require'packer'.init({
  max_jobs=50
})

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Packer can manage itself

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
            barbar = false,
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

  use {'github/copilot.vim', branch = 'release' }

  use {
    'lewis6991/impatient.nvim',
    opt = true,
    config = function() require('impatient') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow'
    },
    run = ':TSUpdate',
  }

  use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' }
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

  use {'neoclide/coc.nvim', branch = 'release'}

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event='VimEnter',
    config = function() require('colorizer').setup() end
  }

  use {'vim-ruby/vim-ruby'}

  use {'wellle/targets.vim'}

  use {'axelf4/vim-strip-trailing-whitespace'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        space_char_blankline = ' ',
        show_end_of_line = true
      })
    end
  }

  use {'svermeulen/vimpeccable'}
  use {'AndrewRadev/splitjoin.vim'} -- Use shortcuts gJ and gS to join and split, respectively
  use {'Konfekt/FastFold'}
  use {'Pocco81/Catppuccino.nvim'}
  use {'Raimondi/delimitMate'} -- Add automatic delimiters ([<{, quotes, etc.
  use {'alfredodeza/jacinto.vim'} -- Formatting & validating json via :Jacinto
  use {'bronson/vim-visual-star-search'}
  use {'editorconfig/editorconfig-Vim'}
  use {'gioele/vim-autoswap'} -- Better, automatic swap file management
  use {'guns/xterm-color-table.vim'}
  use {'haya14busa/vim-asterisk'} -- Improved * motions
  use {'inside/vim-search-pulse'}
  use {'jaydorsey/charblob'}
  use {'jaydorsey/fzf_float', branch=main}
  use {'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut'} -- Use :ToGithub to open the current line in your browser

  -- Bookmarking plugin, might replace markology
  -- mm to create bookmark
  -- mi to bookmark & annotate
  -- ma to show all bookmarks
  use { 'MattesGroeger/vim-bookmarks' }

  use {'jgdavey/tslime.vim', branch=main} -- Send to tmux
  use {'junegunn/limelight.vim'} -- Highlight code blocks with :LimelightToggle
  use {'junegunn/vim-easy-align'} -- Align code

  -- Cursor beacon across huge jumps
  use { 'edluffy/specs.nvim' }

  use {'tversteeg/registers.nvim'}

  use {
    'karb94/neoscroll.nvim',
    config = function() require('neoscroll').setup() end
  }
  use {'kyazdani42/nvim-web-devicons'}

  use {'tpope/vim-surround'} -- vim-surround in lua
  use {
    'machakann/vim-sandwich',
    {
      'andymass/vim-matchup',
      setup = [[require('matchup')]],
      event = 'User ActuallyEditing'
    }
  }

  use {'mbbill/undotree'}
  use {'mhinz/vim-startify'}
  use {'misterbuckley/vim-definitive'}
  -- use {'neovim/nvim-lspconfig'}
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

  -- NERDTree replacement. Use g? to open up help
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }

  -- Statusline plugin written in vim
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- Tabline plugin to show buffers, files, etc.
  use { 'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        enable = true,
        options = {
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 66,
          show_tabs_always = true,
          show_devicons = true,
          show_bufnr = false,
          show_filename_only = true,
        }
      }
      vim.cmd [[
        set guioptions-=e
        set sessionoptions+=tabpages,globals
      ]]
    end,
    requires = { {'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    event = 'BufRead',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        keymaps = { -- Default keymap options
          noremap = true,
          ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
          ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
          ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
          ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
          ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
          ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
          ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
          -- Text objects
          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
        },
        watch_index = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_formatter_opts = { relative_time = false },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        use_internal_diff = true,  -- If vim.diff or luajit is present
        yadm = { enable = false },
      }
    end
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
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'markdown', 'ruby', 'yml'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
