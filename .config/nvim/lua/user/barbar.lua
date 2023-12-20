local status_ok, plugin = pcall(require, 'barbar')

if not status_ok then
  vim.notify('Error loading user/barbar.lua (barbar)\n\n' .. plugin)
  return
end

vim.g.barbar = {
  animation = true,
  tabpages = true,
  clickable = true,
  insert_at_end = true,
}
