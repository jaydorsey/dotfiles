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
  { 'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = true,
    opts = {},
    init = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      -- vim.o.background="dark" -- system default
      vim.cmd('colorscheme gruvbox')
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },

    config = function()
      local icons = {
        Property = " Property",
        Variable = "α Variable",
        Method = "󰆧 Method",
        Function = "󰡱 Function",
        Snippet = " Snippet",
        Keyword = " Keyword",
        Constant = " Constant",
        Field = " Field",
        File = " File",
        Enum = " Enum",
        EnumMember = " Enum Member",
        Struct = " Strcut",
        Class = " Class",
        Interface = " Interface",
        Module = " Module",
        Unit = " Unit",
        Operator = " Operator",
        TypeParameter = " Type Parameter",
        Reference = " Reference",
        Folder = " Folder",
        Color = " Color",
        Event = " Event",
        Value = " Value",
        Text = " Text"
      }

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        }),

        sources = cmp.config.sources(
          {
            { name = "copilot", group_index = 2, },
            { name = "nvim_lsp", group_index = 1 },
            { name = "luasnip", group_index = 1 }, -- For luasnip users.
          },
          {
            { name = "buffer" },
            { name = "path" },
          }
        ),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                          -- can also be a function to dynamically calculate max width such as
                          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
              return vim_item
            end
          })
        },
        opts = {
          debounce = 0,
          throttle = 0,
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,

  },
  {
    'onsails/lspkind.nvim',
    lazy = false,
    config = function()
      require('lspkind').setup({
        symbol_map = {
          Copilot = ""
        }
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
    config = function ()
      require('copilot').setup({
        copilot_node_command = os.getenv("HOME") .."/.local/share/mise/installs/node/22.0.0/bin/node",
      })
      require('copilot_cmp').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
    lazy = false,
    ft = { 'ruby', 'lua' },
  },
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
    ft = { 'ruby', 'erb', },
  },
  { 'norcalli/nvim-colorizer.lua'  }, -- colorize hex/rgb codes like #ff0000
  { 'vim-ruby/vim-ruby', ft = { 'ruby', 'erb' } }, -- ruby syntax and helpers

  { 'wellle/targets.vim' },
  {
    'axelf4/vim-strip-trailing-whitespace',
    lazy = false,
  },
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'dstein64/vim-startuptime' }, -- Measure startup time with :StartupTime
  {
    'AndrewRadev/splitjoin.vim',
    lazy = false,
  }, -- Use shortcuts gJ and gS to join and split, respectively

  -- TODO: Do I need lastplace + vim-stay?
  -- use 'Konfekt/FastFold'
  {
    'ethanholz/nvim-lastplace', -- reopen files at your last edit (lua)
    branch = 'main',
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

  { 'Raimondi/delimitMate', lazy = false, }, -- Add automatic delimiters ([<{, quotes, etc.
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
  -- A matchit replacement
  {
    'andymass/vim-matchup',
    init = function()
      vim.g.matchup_delim_start_plaintext = 0
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_deferred_show_delay = 100
      vim.g.matchup_matchparen_hi_surround_always = 1
      -- vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_override_vimtex = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_transmute_enabled = 0
    end,
    lazy = false,
  },
  { 'machakann/vim-sandwich', dependencies = { 'andymass/vim-matchup', }, lazy = false },
  {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.animate').setup({ cursor = { enable = true } })
      require('mini.files').setup()
      require('mini.hipatterns').setup()
      require('mini.indentscope').setup()
      require('mini.sessions').setup()
      require('mini.starter').setup()
    end,
    lazy = false,
  },
  {
    "kaplanz/retrail.nvim",
    opts = {}, -- calls `setup` using provided `opts`
    lazy = false,
  },
  { 'nvim-lua/completion-nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'rhysd/committia.vim' },
  -- use 'tpope/vim-characterize'
  -- { 'tpope/vim-commentary', lazy = false },
  { 'tpope/vim-dispatch' },
  -- vim sugar for shell commands
  { 'tpope/vim-eunuch', lazy = false },
  { 'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
    },
    ft = { 'ruby' },
  },
  { 'tpope/vim-rails', ft={ 'ruby', 'eruby' } },
  { 'tpope/vim-repeat', lazy = false },
  { 'wincent/ferret'  }, -- Enhanced multi file search
  { 'windwp/nvim-spectre'  }, -- Regex search & replace
  { 'wsdjeg/vim-fetch' },
  -- {
  --   'filipdutescu/renamer.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',         -- required
  --   },
  --   lazy = false ,
  -- },

  {
    "NeogitOrg/neogit",
    dependencies = {
      'nvim-lua/plenary.nvim',         -- required
      'sindrets/diffview.nvim',        -- optional - Diff integration
      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua',              -- optional
    },
    config = true,
    lazy = false,
  },

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
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
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

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
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
  -- {
  --   'dense-analysis/ale',
  --   init = function()
  --     vim.g.ale_disable_lsp = 0
  --     vim.g.ale_lint_on_save = 1
  --     vim.g.ale_fix_on_save = 1
  --     -- vim.g.ale_ruby_rubocop_executable = '~/.local/share/mise/shims/rubocop'
  --     vim.g.ale_ruby_rubocop_executable = 'bundle'
  --     vim.g.ale_ruby_rubocop_options = '--server'
  --     vim.g.ale_ruby_ruby_executable = '~/.local/share/mise/shims/ruby'
  --     vim.g.ale_sign_column_always = 1
  --     vim.g.ale_sign_error = 'î±'
  --     vim.g.ale_sign_warning = 'î¸'
  --     vim.g.ale_linters = {
  --       ruby = {'rubocop', 'ruby', 'brakeman'},
  --       html = {'htmlhint', 'tidy'},
  --       -- 'sh', 'zsh', 'markdown', 'ruby', 'yml'
  --     }
  --     vim.g.ale_fixers = {
  --       ruby = {'rubocop', 'remove_trailing_lines', 'trim_whitespace'},
  --       sh = {'remove_trailing_lines', 'trim_whitespace'},
  --       lua = {'remove_trailing_lines', 'trim_whitespace'},
  --     }
  --   end,
  --   lazy = false
  -- },
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
  {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false,
    opts = {
      useDefaultKeymaps = false,
      disabledKeymaps = { 'gc' }
    },
  },
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
  },
  -- Better iullumination of cursor objects
  {
    'RRethy/vim-illuminate',
    lazy = false,
    config = function()
      require('illuminate').configure {
        providers = {
            'treesitter',
            'lsp',
            'regex',
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({ PATH = "prepend" })
      require("mason-lspconfig").setup()

      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
      require("lspconfig").solargraph.setup {}
      -- require("lspconfig").sorbet.setup {}
      require("lspconfig").jsonls.setup {}
      -- require("lspconfig").gopls.setup {}                -- Go language server
      -- require("lspconfig").tsserver.setup {}             -- TypeScript language server
      -- require("lspconfig").htmx.setup {}                 -- HTMX language server
      require("lspconfig").emmet_language_server.setup { -- Emmet language server
        filetypes = { "html", "css", "eruby" },
      }

      -- TODO: Check on this, see what it conflicts with
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*",
      --   callback = function()
      --     vim.lsp.buf.format { async = false }
      --   end
      -- })

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim", lazy = false
  },
  {
    "neovim/nvim-lspconfig", lazy = false
  },
  {
    'mistricky/codesnap.nvim',
    build = "make build_generator",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      -- { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },
}
