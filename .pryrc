# -*- mode: ruby -*- vim:set ft=ruby:
Pry.config.editor = 'nvim'

Pry.config.history.file = "~/.pry_history"

Pry.config.prompt = proc { |obj, nest_level, _| "pry >> " }
