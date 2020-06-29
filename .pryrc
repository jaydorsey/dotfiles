# -*- mode: ruby -*- vim:set ft=ruby:
# Show X lines before and after the exception line
Pry.config.default_window_size = 14

Pry.config.editor = 'nvim'

Pry.config.pager = true

if Pry::Prompt.respond_to?(:new)
  # These are new pry version settings. We're using the old version in some places
  Pry.config.history_file = "./.pry_history"
  Pry.config.history_should_load = true

  Pry.config.prompt = Pry::Prompt.new(
    "ruby",
    "My custom prompt with Nerdfonts",
    [
      proc { |obj, nest_level, _| "pry \001\e[31m\002\001\e[0m\002 " },
      proc { |obj, nest_level, _| "    | " }
    ]
  )
else
  Pry.config.history.file = "./.pry_history"
  Pry.config.history.should_load = true

  Pry.config.prompt = [
    proc { |obj, nest_level, _| "pry \001\e[31m\002\001\e[0m\002 " },
    proc { |obj, nest_level, _| "    | " }
  ]
end

# Always do big exceptions
# Pry.config.exception_handler = proc do |output, exception, _pry_|
#   _pry_.run_command 'cat --ex'
# end

def fb
  require 'factory_bot'
  require 'faker'

  FactoryBot.definition_file_paths << File.join('spec', 'support', 'factories')
  FactoryBot.find_definitions

  include FactoryBot::Syntax::Methods
end

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

# https://github.com/pry/pry/issues/1619
Pry.config.collision_warning = true

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env
