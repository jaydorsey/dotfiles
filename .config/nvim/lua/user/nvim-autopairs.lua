local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')

if not status_ok then
  vim.notify('Error loading user/nvim-autopairs.lua\n\n' .. plugin)
  return
end

nvim_autopairs.setup {
  enable_check_bracket_line = true,
  disable_filetype = { 'TelescopePrompt', 'vim' },
  enable_afterquote = false,
  enable_moveright = true,
}
