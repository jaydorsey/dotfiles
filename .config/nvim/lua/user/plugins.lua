return {
  -- faster filetype.vim
  { 'nathom/filetype.nvim' },
  { 'kyazdani42/nvim-web-devicons', lazy=false },
  {
    'windwp/nvim-autopairs', -- automatically adds pair brackets. lua
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = '[%w%.]',
      fast_wrap = {},
    },
    event = 'BufReadPost',
  },
  { 
    'dracula/vim',
    as = 'dracula',
    config = function() 
      vim.cmd 'colorscheme dracula' 
    end, 
    lazy=false
  },

  -- { 'rebelot/kanagawa.nvim', config = function() vim.cmd 'colorscheme kanagawa' end, },
  -- { 'github/copilot.vim', branch = 'release', ft = { 'ruby' } },

  { 'Exafunction/codeium.vim' },

  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow'
    },
    run = ':TSUpdate',
  },

  { 'imsnif/kdl.vim' },

  -- { 'autozimu/LanguageClient-neovim', branch = 'next', run = 'bash install.sh' } },

  { 'christoomey/vim-sort-motion' },
  { 'haya14busa/vim-asterisk'  }, -- Improved * motions
  { 'bronson/vim-visual-star-search' },
  { 'mechatroner/rainbow_csv' },

  -- Line-wise & delimiter sorting
  { 'sQVe/sort.nvim', config = function() require("sort").setup({}) end },

  { 'francoiscabrol/ranger.vim', requires = { 'rbgrouleff/bclose.vim' } },

  { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', after = 'nvim-treesitter' },
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
  { 'norcalli/nvim-colorizer.lua'  }, -- colorize hex/rgb codes like #ff0000
  { 'vim-ruby/vim-ruby', ft = { 'ruby', 'erb' } }, -- ruby syntax and helpers

  { 'wellle/targets.vim' },
  { 'axelf4/vim-strip-trailing-whitespace' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { 'dstein64/vim-startuptime' }, -- Measure startup time with :StartupTime
  { 'AndrewRadev/splitjoin.vim'  }, -- Use shortcuts gJ and gS to join and split, respectively

  -- TODO: Do I need lastplace + vim-stay?
  -- use 'Konfekt/FastFold'
  { 'ethanholz/nvim-lastplace', branch=main }, -- reopen files at your last edit (lua)
  { 'gioele/vim-autoswap'  }, -- Better, automatic swap file management
  { 'lambdalisue/readablefold.vim' }, -- improved foldtext
  { 'zhimsel/vim-stay' }, -- view creation, fold

  { 'Raimondi/delimitMate' }, -- Add automatic delimiters ([<{, quotes, etc.
  { 'alfredodeza/jacinto.vim', ft = {'json'}, }, -- Formatting & validating json via :Jacinto
  { 'editorconfig/editorconfig-Vim' },
  { 'guns/xterm-color-table.vim' },

  -- use 'inside/vim-search-pulse'
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      local opts = require('config').opts
      vim.api.nvim_set_keymap(
        'n',
        'n',
        [[:execute('normal! ' . v:count1 . 'n')<CR>:lua require('hlslens').start()<CR>]],
        opts
      )
      vim.api.nvim_set_keymap(
        'n',
        'N',
        [[:execute('normal! ' . v:count1 . 'N')<CR>:lua require('hlslens').start()<CR>]],
        opts
      )
    end,
  },

  { 'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut' },

  {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  },

  -- Bookmarking plugin, might replace markology
  -- mm to create bookmark
  -- mi to bookmark & annotate
  -- ma to show all bookmarks
  { 'MattesGroeger/vim-bookmarks' },
  -- { 'jgdavey/tslime.vim', branch=main }, -- Send to tmux
  { 'junegunn/limelight.vim' }, -- Highlight code blocks with :LimelightToggle
  { 'junegunn/vim-easy-align' }, -- Align code
  { 'tversteeg/registers.nvim' },

  -- use 'karb94/neoscroll.nvim' -- Smooth scrolling plugin
  {
    'petertriho/nvim-scrollbar',
    require = {
      'kevinhwang91/nvim-hlslens',
      'lewis6991/gitsigns.nvim'
    },
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.search').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },

  {
    'andymass/vim-matchup',
    init = function()
      require 'config.matchup'
    end,
    lazy = false,
  },
  {
    'machakann/vim-sandwich',
    {
      'andymass/vim-matchup',
      setup = [[require('matchup')]],
      event = 'User ActuallyEditing'
    }
  },

  { 'mbbill/undotree' },
  {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.animate').setup({
        cursor = { enable = true }
      })
      require('mini.hipatterns').setup()
      require('mini.files').setup()
      require('mini.sessions').setup()
      require('mini.starter').setup()
    end;
  },
  { 'nvim-lua/completion-nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'rhysd/committia.vim' },
  -- use 'tpope/vim-characterize'
  { 'tpope/vim-dispatch' },
  { 
    'tpope/vim-eunuch', -- vim sugar for shell commands
    lazy = false
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rails' },
  { 'tpope/vim-repeat' },
  { 'wincent/ferret'  }, -- Enhanced multi file search
  { 'windwp/nvim-spectre'  }, -- Regex search & replace
  { 'wsdjeg/vim-fetch' },

  {
    'sheerun/vim-polyglot',
    setup = function()
      -- disabled filetypes
      vim.g.polyglot_disabled = {}
      -- vue behaviors
      vim.g.vue_pre_processors = 'detect_on_enter'
      -- markdown behaviors
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_toml_frontmatter = 1
      vim.g.vim_markdown_json_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      -- csv behaviors
      vim.g.csv_no_conceal = 1
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },

  { 'APZelos/blamer.nvim' },
  { 'elzr/vim-json', ft={ 'json' } }, -- better JSON highlight, warnings, etc

  -- highlight words and lines on the cursor
  -- use({
  --   'yamatsum/nvim-cursorline',
  --   config = function()
  --     require('nvim-cursorline').setup({
  --       cursorline = {
  --         enable = true,
  --         timeout = 500,
  --         number = false,
  --       },
  --     })
  --   end,
  -- })

  -- use 'easymotion/vim-easymotion'
  -- use {
  --   'phaazon/hop.nvim',
  --   branch = 'v2',
  --   config = function()
  --     local opts = require('config').opts
  --     require('hop').setup()
  --     vim.api.nvim_set_keymap('n', 's', ':HopChar2<CR>', opts)
  --     vim.api.nvim_set_keymap('n', 'S', ':HopChar2MW<CR>', opts)
  --     -- use `<Cmd>lua` instead of `:lua`
  --     -- https://github.com/phaazon/hop.nvim/issues/89#issuecomment-854701856
  --     vim.api.nvim_set_keymap(
  --       '',
  --       'f',
  --       '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true })<CR>',
  --       opts
  --     )
  --     vim.api.nvim_set_keymap(
  --       '',
  --       'F',
  --       '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>',
  --       opts
  --     )
  --     vim.api.nvim_set_keymap(
  --       '',
  --       't',
  --       '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>',
  --       opts
  --     )
  --     vim.api.nvim_set_keymap(
  --       '',
  --       'T',
  --       '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>',
  --       opts
  --     )
  --   end,
  -- }

  { 'tarekbecker/vim-yaml-formatter', ft={ 'yaml', 'yml' } },

  { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local opts = require('config').opts

      require('fzf-lua').setup({
          preview_layout = 'flex',
          flip_columns = 150,
          -- fzf_opts = {
          --   ['--border'] = 'none',
          --   ['--layout'] = 'reverse-list'
          -- },
          grep = {
            -- Use glob with ctrl+g:
            --     foo -- *_spec.rb
            glob_flag = "--iglob", -- for case sensitive globs use --glob
            glob_separator = "%s%-%-", -- query separate pattern (lua): ' --''
            rg_glob = true, -- enable glob pasring for all grep providers
            rg_opts = "--sort-files --column --line-number --no-heading " ..
                      "--color=always --hidden --smart-case --max-columns=4096",
          },
          winopts = {
            preview = {
              hidden = "hidden"
            }
          }
        }
      )
    end,
    lazy = false
  },

  { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }, -- This is also used by zsh

  -- NERDTree replacement. Use g? to open up help
  { 
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', } ,
    config = function()
      require('nvim-tree').setup({})
    end
  },


  -- fast status line plugin written in vim
  { 
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } ,
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {},
      })
    end
  },

  -- bufferline plugin
  {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end
  },

  -- Tabline/statusline plugin with different features
  -- use {
  --   'romgrk/barbar.nvim',
  --   config = function()
  --     require('barbar').setup({
  --       animation = true,
  --       clickable = true,
  --       insert_at_end = true,
  --       tabpages = true
  --     })
  --   end
  -- }

  {
    'lewis6991/gitsigns.nvim',
    require = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end
    -- event = 'BufRead'
  },

  { 'numToStr/Comment.nvim'  }, -- Comment plugin, in lua
  { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'folke/which-key.nvim' },

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
  {
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
}
