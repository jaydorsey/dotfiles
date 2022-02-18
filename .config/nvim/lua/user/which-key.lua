local status_ok, plugin = pcall(require, 'which-key')

if not status_ok then
  vim.notify('Error loading user/which-key.lua\n\n' .. plugin)
  return
end

plugin.setup {}
