local status_ok, plugin = pcall(require, 'bufferline.nvim')

if not status_ok then
  vim.notify('Error loading user/bufferline.lua\n\n' .. plugin)
  return
end

vim.g.bufferline = {
  animation = false,
  tabpages = true,
  insert_at_end = true,
}
