# -*- mode: ruby -*- vim:set ft=ruby:
# Show X lines before and after the exception line
Pry.config.default_window_size = 20

Pry.config.editor = 'nvim'

Pry.config.history.file = "~/.pry_history"

Pry.config.prompt = proc { |obj, nest_level, _| "pry >> " }
