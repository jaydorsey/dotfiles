local status_ok, plugin = pcall(require, 'colorizer')

if not status_ok then
  vim.notify('Error loading user/nvim-colorizer.lua\n\n' .. plugin)
  return
end

plugin.setup()
