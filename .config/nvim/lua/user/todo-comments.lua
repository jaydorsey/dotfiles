local status_ok, plugin = pcall(require, 'todo-comments')

if not status_ok then
  vim.notify('Error loading user/todo-comments.lua\n\n' .. plugin)
  return
end

plugin.setup {}
