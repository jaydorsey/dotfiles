return {
  -- faster filetype.vim
  -- { 'nathom/filetype.nvim', lazy=false },
  { 'nvim-tree/nvim-web-devicons', lazy=false },
  {
    'windwp/nvim-autopairs', -- automatically adds pair brackets. lua
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = '[%w%.]',
      fast_wrap = {},
    },
    -- event = 'BufReadPost',
  },
  { 
    'dracula/vim',
    name = 'dracula',
    config = function() 
      vim.cmd 'colorscheme dracula' 
    end, 
    lazy=false
  },

  -- { 'rebelot/kanagawa.nvim', config = function() vim.cmd 'colorscheme kanagawa' end, },
  -- { 'github/copilot.vim', branch = 'release', ft = { 'ruby' } },

  { 'Exafunction/codeium.vim' },

  { 'imsnif/kdl.vim' },

  -- { 'autozimu/LanguageClient-neovim', branch = 'next', build = 'bash install.sh' } },

  { 'christoomey/vim-sort-motion' },
  { 'haya14busa/vim-asterisk'  }, -- Improved * motions
  { 'bronson/vim-visual-star-search' },
  { 'mechatroner/rainbow_csv' },

  -- Line-wise & delimiter sorting
  { 'sQVe/sort.nvim', config = function() require("sort").setup({}) end },

  { 'francoiscabrol/ranger.vim', dependencies = { 'rbgrouleff/bclose.vim' } },


  --
  --
  -- treesitter/lsp stuff
  --
  --
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
  },
  { 'RRethy/nvim-treesitter-textsubjects', dependencies = { 'nvim-treesitter' } },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter' } },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', dependencies = { 'nvim-treesitter' } },
  {
    'danymat/neogen', -- Annotation
    dependencies = 'nvim-treesitter',
    config = function()
      require 'config.neogen'
    end,
    keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  },
  {
    'stevearc/aerial.nvim', -- code outline
    opts = {
      backends = { 'lsp', 'treesitter', 'markdown', 'man' },
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
    },
    cmd = { 'AerialOpen', 'AerialToggle' },
  },
  {
    'lewis6991/hover.nvim',
    event = 'BufReadPost',
    config = function()
      require('hover').setup {
        init = function()
          require 'hover.providers.lsp'
        end,
      }

      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
      vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
    end,
  },
  {
    'DNLHC/glance.nvim',
    cmd = 'Glance',
    config = function()
      require('glance').setup {
        detached = true,
        border = { enable = true, top_char = '─', bottom_char = '─' },
        theme = { mode = 'brighten' },
        indent_lines = { icon = '│' },
        winbar = { enable = true },
      }
    end,
  },
  { 'neovim/nvim-lspconfig' },
  {
    'SmiteshP/nvim-navic', -- code context
    dependencies = 'neovim/nvim-lspconfig',
    opts = { lazy_update_context = true },
  },


  { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
  { 'norcalli/nvim-colorizer.lua'  }, -- colorize hex/rgb codes like #ff0000
  { 'vim-ruby/vim-ruby', ft = { 'ruby', 'erb' } }, -- ruby syntax and helpers

  { 'wellle/targets.vim' },
  { 'axelf4/vim-strip-trailing-whitespace' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { 'dstein64/vim-startuptime' }, -- Measure startup time with :StartupTime
  { 'AndrewRadev/splitjoin.vim', lazy=false }, -- Use shortcuts gJ and gS to join and split, respectively

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
    dependencies = 'nvim-lua/plenary.nvim',
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
  { 'machakann/vim-sandwich', dependencies = { 'andymass/vim-matchup', } },

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
  { 'tpope/vim-fugitive', lazy=false },
  { 'tpope/vim-rails' },
  { 'tpope/vim-repeat' },
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
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    tag = '0.1.5',
    init = function()
      require 'config.telescope_setup'
    end,
    config = function()
      require 'config.telescope'
    end,
    cmd = 'Telescope',
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'crispgm/telescope-heading.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- NERDTree replacement. Use g? to open up help
  { 
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', } ,
    config = function()
      require('nvim-tree').setup({})
    end
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
    lazy=false
  },
  {
    'ojroques/nvim-bufdel', -- better buffer deletion
    cmd = 'BufDel',
    opts = {},
  },
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
    -- event = 'BufReadPost',
    opts = { colors = { info = { 'WhiteHover' } } },
  },
  { 'folke/which-key.nvim' },

  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope-fzy-native.nvim',
  --     { 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
  --   }
  -- }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'dense-analysis/ale',
    init = function()
      vim.g.ale_linters = {
        'sh', 'zsh', 'markdown', 'ruby', 'yml'
      }
    end,
    lazy=false
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
  {
    'folke/noice.nvim', -- experimental alert replacement
    opts = {
      views = { mini = { timeout = 10000, lang = 'markdown' } },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'lsp',
            kind = 'progress',
            find = 'null-l',
          },
          opts = { skip = true, stop = true },
        },
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = { 'MunifTanjim/nui.nvim' },
    event = 'VeryLazy',
  },
  {
    'chrisgrieser/nvim-various-textobjs', -- new nvim textobjs
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
}
