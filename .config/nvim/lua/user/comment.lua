local status_ok, plugin = pcall(require, 'Comment')

if not status_ok then
  vim.notify('Error loading user/comment.lua\n\n' .. plugin)
  return
end

plugin.setup {}
