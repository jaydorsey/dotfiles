return {
  -- faster filetype.vim
  { 'nathom/filetype.nvim' },
  {
    'windwp/nvim-autopairs', -- automatically adds pair brackets. lua
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = '[%w%.]',
      fast_wrap = {},
    },
    -- event = 'BufReadPost',
  },
  -- { 
  --   'dracula/vim',
  --   name = 'dracula',
  --   config = function() 
  --     vim.cmd 'colorscheme dracula' 
  --   end, 
  --   lazy = false
  -- },

  -- { 'rebelot/kanagawa.nvim', config = function() vim.cmd 'colorscheme kanagawa' end, },
  -- { 'github/copilot.vim', branch = 'release', ft = { 'ruby' } },

  { 'Exafunction/codeium.vim', lazy = false },
  { 'imsnif/kdl.vim' },

  -- { 'autozimu/LanguageClient-neovim', branch = 'next', build = 'bash install.sh' } },

  { 'christoomey/vim-sort-motion' },
  { 'haya14busa/vim-asterisk', lazy = false,  }, -- Improved * motions
  { 'bronson/vim-visual-star-search', lazy = false, },
  { 'mechatroner/rainbow_csv' },

  -- Line-wise & delimiter sorting
  { 'sQVe/sort.nvim', config = function() require("sort").setup({}) end },

  { 'francoiscabrol/ranger.vim', dependencies = { 'rbgrouleff/bclose.vim' } },

  {
    'jaydorsey/nvim-treesitter',
    branch = 'jaydorsey/keybind-error-message',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',

    },
    build = ':TSUpdate',
    -- event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require 'config.treesitter'
    end,
    lazy = false,
  },
  { 'RRethy/nvim-treesitter-textsubjects', dependencies = { 'nvim-treesitter' }, lazy = false, },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter' }, lazy = false, },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', dependencies = { 'nvim-treesitter' }, lazy = false, },
  {
    'danymat/neogen', -- Annotation
    dependencies = 'nvim-treesitter',
    config = function()
      require 'config.neogen'
    end,
    keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
    lazy = false,
  },
  {
    'stevearc/aerial.nvim', -- code outline
    opts = {
      backends = { 'treesitter', 'markdown', 'man' },
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    },
    cmd = { 'AerialOpen', 'AerialToggle' },
  },
  { 'norcalli/nvim-colorizer.lua'  }, -- colorize hex/rgb codes like #ff0000
  { 'vim-ruby/vim-ruby', ft = { 'ruby', 'erb' } }, -- ruby syntax and helpers

  { 'wellle/targets.vim' },
  { 'axelf4/vim-strip-trailing-whitespace' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'dstein64/vim-startuptime' }, -- Measure startup time with :StartupTime
  { 'AndrewRadev/splitjoin.vim', lazy = false }, -- Use shortcuts gJ and gS to join and split, respectively

  -- TODO: Do I need lastplace + vim-stay?
  -- use 'Konfekt/FastFold'
  { 
    'ethanholz/nvim-lastplace', -- reopen files at your last edit (lua)
    branch=main ,
    opts = {
      lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
      lastplace_ignore_filetype = {
        'gitcommit',
        'gitrebase',
        'svn',
        'hgcommit',
      },
    },
    event = 'BufReadPre',
    priority = 1001,
  }, 
  { 'gioele/vim-autoswap'  }, -- Better, automatic swap file management
  { 'lambdalisue/readablefold.vim' }, -- improved foldtext
  { 'zhimsel/vim-stay' }, -- view creation, fold

  { 'Raimondi/delimitMate' }, -- Add automatic delimiters ([<{, quotes, etc.
  { 'alfredodeza/jacinto.vim', ft = {'json'}, }, -- Formatting & validating json via :Jacinto
  { 'editorconfig/editorconfig-Vim', lazy = false },
  { 'guns/xterm-color-table.vim' },
  {
    'kevinhwang91/nvim-hlslens',
    dependencies = { 'haya14busa/vim-asterisk' },
    config = function()
      require('hlslens').setup {
        calm_down = true,
        virt_priority = 50,
      }
    end
  },

  { 'jaydorsey/vim-to-github', branch='jay/add_blame_shortcut', lazy = false },

  -- Bookmarking plugin, might replace markology
  -- mm to create bookmark
  -- mi to bookmark & annotate
  -- ma to show all bookmarks
  { 'MattesGroeger/vim-bookmarks' },
  -- { 'jgdavey/tslime.vim', branch=main }, -- Send to tmux
  { 'junegunn/limelight.vim' }, -- Highlight code blocks with :LimelightToggle
  { 'junegunn/vim-easy-align', lazy = false }, -- Align code
  { 'tversteeg/registers.nvim' },

  -- use 'karb94/neoscroll.nvim' -- Smooth scrolling plugin
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
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
      require('config.matchup')
    end,
    lazy = false,
  },
  { 'machakann/vim-sandwich', dependencies = { 'andymass/vim-matchup', }, lazy = false },
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
    end,
    lazy = false,
  },
  { 'nvim-lua/completion-nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'rhysd/committia.vim' },
  -- use 'tpope/vim-characterize'
  { 'tpope/vim-commentary', lazy = false },
  { 'tpope/vim-dispatch' },
  -- vim sugar for shell commands
  { 'tpope/vim-eunuch', lazy = false },
  { 'tpope/vim-fugitive', lazy = false },
  { 'tpope/vim-rails', ft={ 'ruby', 'eruby' } },
  { 'tpope/vim-repeat', lazy = false },
  { 'wincent/ferret'  }, -- Enhanced multi file search
  { 'windwp/nvim-spectre'  }, -- Regex search & replace
  { 'wsdjeg/vim-fetch' },

  {
    'sheerun/vim-polyglot',
    init = function()
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
      vim.g.json_no_conceal = 1
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },

  { 'APZelos/blamer.nvim' },
  { 'elzr/vim-json', ft={ 'json' } }, -- better JSON highlight, warnings, etc

  { 'tarekbecker/vim-yaml-formatter', ft={ 'yaml', 'yml' } },
  { 'junegunn/fzf',  build = './install --all', lazy = false },

  -- Telescope
  { 'crispgm/telescope-heading.nvim' },
  -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
  { 'nvim-telescope/telescope-fzy-native.nvim', },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      -- 'telescope-fzf-native.nvim',
      'telescope-fzy-native.nvim',
    },
    init = function()
      require 'config.telescope_setup'
    end,
    config = function()
      require 'config.telescope'
    end,
    cmd = 'Telescope',
    lazy = false,
  },

  {
    'mbbill/undotree', cmd = 'UndotreeToggle',
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- NERDTree replacement. Use g? to open up help
  { 'nvim-tree/nvim-web-devicons', lazy = false },
  { 
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', } ,
    config = function()
      require('nvim-tree').setup({})
    end,
    lazy = false,
  },

  -- fast status line plugin written in vim
  { 
    'hoob3rt/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy=true } ,
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

  {
    'akinsho/bufferline.nvim', -- bufferline plugin
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup()
    end,
    lazy = false
  },
  -- better buffer deletion
  { 'ojroques/nvim-bufdel', cmd = 'BufDel', opts = {}, },
  -- look at nanozuki/tabby.nvim as well

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
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end
    -- event = 'BufRead'
  },

  { 'numToStr/Comment.nvim'  }, -- Comment plugin, in lua
  { 
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
    lazy = false,
  },
  { 'folke/which-key.nvim' },

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'dense-analysis/ale',
    init = function()
      vim.g.ale_disable_lsp = 0
      vim.g.ale_lint_on_save = 1
      vim.g.ale_fix_on_save = 1
      vim.g.ale_ruby_rubocop_executable = 'bundle'
      vim.g.ale_ruby_rubocop_options = '--server'
      vim.g.ale_ruby_ruby_executable = '~/.local/share/rtx/shims/ruby'
      vim.g.ale_sign_column_always = 1
      vim.g.ale_sign_error = 'î±'
      vim.g.ale_sign_warning = 'î¸'
      vim.g.ale_linters = {
        ruby = {'rubocop', 'ruby', 'brakeman'},
        html = {'htmlhint', 'tidy'},
        -- 'sh', 'zsh', 'markdown', 'ruby', 'yml'
      }
      vim.g.ale_fixers = {
        ruby = {'rubocop', 'remove_trailing_lines', 'trim_whitespace'},
        sh = {'remove_trailing_lines', 'trim_whitespace'},
      }
    end,
    lazy = false
  },
  {
    'utilyre/barbecue.nvim',
    event = 'User ActuallyEditing',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      create_autocmd = false,
      attach_navic = false,
      show_modified = true,
      exclude_filetypes = { 'netrw', 'toggleterm', 'NeogitCommitMessage' },
      custom_section = function()
        -- Copied from @akinsho's config
        local error_icon = '' -- '✗'
        local warning_icon = ''
        local info_icon = '' --  
        local hint_icon = '⚑' --  ⚑
        local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        local components = {}
        if errors > 0 then
          components[#components + 1] = { error_icon .. ' ' .. errors, 'DiagnosticError' }
        end

        if warnings > 0 then
          components[#components + 1] =
            { (#components > 0 and ' ' or '') .. warning_icon .. ' ' .. warnings, 'DiagnosticWarning' }
        end

        if hints > 0 then
          components[#components + 1] =
            { (#components > 0 and ' ' or '') .. hint_icon .. ' ' .. hints, 'DiagnosticHint' }
        end

        if info > 0 then
          components[#components + 1] =
            { (#components > 0 and ' ' or '') .. info_icon .. ' ' .. info, 'DiagnosticInfo' }
        end

        return components
      end,
    },
  },
  {
    'beauwilliams/focus.nvim', -- auto split windows
    opts = { 
      excluded_filetypes = { 'toggleterm', 'TelescopePrompt' },
      signcolumn = false 
    },
    event = 'VeryLazy',
  },
  -- new nvim textobjs
  { 'chrisgrieser/nvim-various-textobjs', lazy = false, opts = { useDefaultKeymaps = true }, },
  { 'echasnovski/mini.nvim', lazy = false, },
  -- structural search and replace in a file
  { 'cshuaimin/ssr.nvim',
    config = function()
      require('ssr').setup {
        border = 'rounded',
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        adjust_window = true,
        keymaps = {
          close = 'q',
          next_match = 'n',
          prev_match = 'N',
          replace_confirm = '<cr>',
          replace_all = '<leader><cr>',
        },
      }
    end
  }
}
