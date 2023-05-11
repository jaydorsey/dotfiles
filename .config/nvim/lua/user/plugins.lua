local fn = vim.fn

vim.g.ale_ruby_rubocop_options = '--server'
vim.g.ale_ruby_rubocop_executable = '~/.local/share/rtx/shims/rubocop'
vim.g.ale_ruby_ruby_executable = '~/.local/share/rtx/shims/ruby'

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

-- Automatically update & reload plugins when this file is saved
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

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

    -- use {
    --   'github/copilot.vim',
    --   branch = 'release',
    --   ft = {
    --     'ruby'
    --   }
    -- }

    use {
      'Exafunction/codeium.vim'
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

    -- use 'inside/vim-search-pulse'
    use({
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
    })

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

    -- use 'karb94/neoscroll.nvim' -- Smooth scrolling plugin
    use({
      'petertriho/nvim-scrollbar',
      require = { 'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim' },
      config = function()
        require('scrollbar').setup()
        require('scrollbar.handlers.search').setup()
        require('scrollbar.handlers.gitsigns').setup()
      end,
    })

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

    use({
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
    })

    use({
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn['mkdp#util#install']()
      end,
      ft = { 'markdown' },
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
      end,
    })

    use('lambdalisue/readablefold.vim')

    use 'APZelos/blamer.nvim'
    use {
      'elzr/vim-json',
      ft={
        'json'
      }
    }

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
    use {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function()
        local opts = require('config').opts
        require('hop').setup()
        vim.api.nvim_set_keymap('n', 's', ':HopChar2<CR>', opts)
        vim.api.nvim_set_keymap('n', 'S', ':HopChar2MW<CR>', opts)
        -- use `<Cmd>lua` instead of `:lua`
        -- https://github.com/phaazon/hop.nvim/issues/89#issuecomment-854701856
        vim.api.nvim_set_keymap(
          '',
          'f',
          '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true })<CR>',
          opts
        )
        vim.api.nvim_set_keymap(
          '',
          'F',
          '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>',
          opts
        )
        vim.api.nvim_set_keymap(
          '',
          't',
          '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>',
          opts
        )
        vim.api.nvim_set_keymap(
          '',
          'T',
          '<Cmd>lua require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>',
          opts
        )
      end,
    }

    use {
      'tarekbecker/vim-yaml-formatter',
      ft={
        'yaml',
        'yml'
      }
    }

    use { 'ibhagwan/fzf-lua',
      requires = { 'nvim-tree/nvim-web-devicons' },
      -- map("n", "<leader>p", "<cmd>lua require('fzf-lua').files({ fzf_opts = { ['--layout'] = 'reverse-list', ['--height'] = '10%' } } })<CR>", { silent = true })

      -- Need this on grep_project

      config = function()
        local opts = require('config').opts

        require('fzf-lua').setup({
            -- preview_layout = 'flex',
            -- flip_columns = 150,
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
    }

    -- This is also used by zsh
    use {
      'junegunn/fzf',
      dir = '~/.fzf',
      run = './install --all'
    }

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
