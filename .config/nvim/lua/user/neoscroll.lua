local status_ok, plugin = pcall(require, 'neoscroll')

if not status_ok then
  vim.notify('Error loading user/neoscroll.lua\n\n' .. plugin)
  return
end

plugin.setup {}
