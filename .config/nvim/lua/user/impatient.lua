local status_ok, impatient = pcall(require, 'impatient')

if not status_ok then
  vim.notify('Error loading user/impatient.lua\n\n' .. impatient)
  return
end

impatient.enable_profile()
