# -*- mode: ruby -*- vim:set ft=ruby:
# Show X lines before and after the exception line
puts "Loading ~/.pryrc..."

Pry.config.default_window_size = 14

Pry.config.editor = 'nvim'

Pry.config.history.file = "~/.pry_history"
Pry.config.history.should_load = true

Pry.config.prompt = [
  proc { |obj, nest_level, _| "pry \001\e[31m\002\001\e[0m\002 " },
  proc { |obj, nest_level, _| "    | " }
]

# Always do big exceptions
# Pry.config.exception_handler = proc do |output, exception, _pry_|
#   _pry_.run_command 'cat --ex'
# end

# https://docs.gitlab.com/ee/development/pry_debugging.html#short-commands
if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
end

Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

puts "Loaded!"
