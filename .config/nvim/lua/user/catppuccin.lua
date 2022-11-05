local status_ok, plugin = pcall(require, 'catppuccin')

if not status_ok then
  vim.notify('Error loading user/catppuccin.lua\n\n' .. plugin)
  return
end

plugin.setup {
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = { 'italic' },
    functions = { 'italic' },
    keywords = { 'italic' },
    strings = {},
    variables = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
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
  }
}
