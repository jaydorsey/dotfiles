local telescope = require 'telescope'
local fb_actions = telescope.extensions.file_browser.actions
local actions = require('telescope.actions')
local custom_pickers = require('config/telescope_custom_pickers')
local pretty_pickers = require('config/telescope_pretty_pickers')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
    color_devicons = true,
    -- layout_strategy = 'horizontal',
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'top',
      vertical = {
        height = 0.99,
        width = 0.99,
        preview_height = 0.6,
        preview_cutoff = 10,
        mirror = true
      },
      horizontal = {
        height = 0.99,
        width = 0.99,
    --     preview_height = 0.99,
        preview_width = 0.6,
        preview_cutoff = 10,
      },
    },
    -- scroll_strategy = 'cycle',
    -- theme = require('telescope.themes').get_dropdown {
    --   layout_config = {
    --     prompt_position = 'top',
    --     horizontal = {
    --       height = 0.99,
    --       width = 0.99,
    --       preview_height = 0.99,
    --       preview_width = 0.5,
    --     },
    --   }
    -- },
    -- ripgrep_arguments = {
    --   'rg',
    --   '--hidden',
    --   '--no-heading',
    --   '--with-filename',
    --   '--line-number',
    --   '--column',
    --   '--smart-case'
    -- }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    -- fzf = {
    --   fuzzy = true,
    --   override_generic_sorter = true,
    --   override_file_sorter = true,
    --   case_mode = 'smart_case',
    -- },
    -- ['ui-select'] = {
    --   require('telescope.themes').get_dropdown {
    --     layout_config = {
    --       prompt_position = 'top',
    --       horizontal = {
    --         height = 0.99,
    --         width = 0.99,
    --         preview_height = 0.99,
    --         preview_width = 0.5,
    --       },
    --     }
    --   },
    -- },
    heading = { treesitter = true },
    file_browser = {
      hijack_netwrw = true,
      hidden = true,
      -- mappings = {
      --   i = {
      --     ['<c-n>'] = fb_actions.create,
      --     ['<c-r>'] = fb_actions.rename,
      --     ['<c-h>'] = fb_actions.toggle_hidden,
      --     ['<c-x>'] = fb_actions.remove,
      --     ['<c-p>'] = fb_actions.move,
      --     ['<c-y>'] = fb_actions.copy,
      --     ['<c-a>'] = fb_actions.select_all,
      --   },
      -- },
    },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      sort_lastused = true,
      previewer = true,
    },
    live_grep = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = true,
      path_display = { 'shorten' },
      mappings = {
        i = {
          -- ['<c-f>'] = custom_pickers.actions.set_extension,
          ['<c-f>'] = custom_pickers.actions.set_folders,
        },
      },
    },
    find_files = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = true,
      sort_lastused = true,
    },
  },
}

-- Extensions
telescope.load_extension 'aerial'
telescope.load_extension 'file_browser'
telescope.load_extension 'fzy_native'
telescope.load_extension 'heading'
telescope.load_extension 'ui-select'
