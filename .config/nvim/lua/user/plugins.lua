return {
  -- faster filetype.vim
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
    'ellisonleao/gruvbox.nvim',
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

  { 'mechatroner/rainbow_csv', ft = { 'csv' }, },
  { 'haya14busa/vim-asterisk', lazy = false,  }, -- Improved * motions
  { 'bronson/vim-visual-star-search', lazy = false, },
  { 'christoomey/vim-sort-motion' }, -- sort text objects with motions, like gsi( to sort in parens
  { 'sQVe/sort.nvim', config = function() require("sort").setup({}) end }, -- Line-wise & delimiter sorting

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
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
  {
    'danymat/neogen', -- Annotation. Use the command :Neogen
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
  { 'slim-template/vim-slim', ft = { 'slim' } },
  { 'wellle/targets.vim' }, -- additional text object targets

  -- { 'axelf4/vim-strip-trailing-whitespace', lazy = false, },
  { "kaplanz/retrail.nvim", opts = {}, lazy = false, }, -- strip trailing whitespace automatically

  -- { 'dstein64/vim-startuptime' }, -- Measure startup time with :StartupTime
  { 'AndrewRadev/splitjoin.vim', lazy = false, }, -- Use shortcuts gJ and gS to join and split, respectively

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
  -- { 'alfredodeza/jacinto.vim', ft = {'json'}, }, -- Formatting & validating json via :Jacinto
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
  { 'junegunn/limelight.vim' }, -- Highlight code blocks with :LimelightToggle
  { 'junegunn/vim-easy-align', lazy = false }, -- Align code
  { 'tversteeg/registers.nvim' },

  -- A matchit replacement
  {
    'andymass/vim-matchup',
    init = function()
      vim.g.matchup_delim_start_plaintext = 0
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_deferred_show_delay = 500
      vim.g.matchup_matchparen_deferred_hide_delay = 1000
      vim.g.matchup_matchparen_timeout = 30
      vim.g.matchup_matchparen_insert_timeout = 50
      vim.g.matchup_matchparen_hi_surround_always = 0
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
  { 'nvim-lua/completion-nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  {
    "rhysd/committia.vim",
    ft = "gitcommit",
    config = function()
        vim.g.committia_min_window_width = 140
        vim.g.committia_edit_window_width = 90
    end,
  },
  { 'tpope/vim-dispatch' },
  { 'tpope/vim-eunuch', lazy = false }, -- vim sugar for shell commands
  { 'tpope/vim-fugitive',
    dependencies = {
      'tpope/vim-rhubarb',
    },
    ft = { 'ruby' },
  },
  { 'tpope/vim-rails', ft={ 'ruby', 'eruby' } },
  { 'tpope/vim-repeat', lazy = false },
  { 'wincent/ferret'  }, -- Enhanced multi file search
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
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },

  {
    'APZelos/blamer.nvim',
    lazy = false,
  }, -- git blame plugin, similar to vscode lens
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
      'danielfalk/smart-open.nvim',
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
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },

  {
    'mbbill/undotree', cmd = 'UndotreeToggle',
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
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

  -- look at nanozuki/tabby.nvim as well
  {
    'akinsho/bufferline.nvim', -- bufferline plugin
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup()
    end,
    lazy = false
  },
  { 'ojroques/nvim-bufdel', cmd = 'BufDel', opts = {}, }, -- better buffer deletion

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
  -- { 'folke/which-key.nvim' },
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
      keymaps = { useDefaults = false },
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
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  { "neovim/nvim-lspconfig", lazy = false },
  {
    'mistricky/codesnap.nvim',
    build = "make build_generator",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      -- { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },

  --- File management
  -- { 'francoiscabrol/ranger.vim', dependencies = { 'rbgrouleff/bclose.vim' } },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>e",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
