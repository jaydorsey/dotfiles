local status_ok, plugin = pcall(require, 'nvim-tree')

if not status_ok then
  vim.notify('Error loading user/nvim-tree.lua\n\n' .. plugin)
  return
end

plugin.setup {}
