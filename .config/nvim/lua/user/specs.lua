local status_ok, specs = pcall(require, 'specs')

if not status_ok then
  return
end

specs.setup({
  show_jumps = true,
  min_jump = 10,
  popup = {
    width = 60,
    fader = require('specs').linear_fader,
    resizer = require('specs').shrink_resizer
  },
  ignore_filetypes = {
    qf = true
  },
  ignore_buftypes = {
    nofile = true,
    quickfix = true
  }
})
