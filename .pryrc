# frozen_string_literal: true

# -*- mode: ruby -*- vim:set ft=ruby:

ENV_COLORS = {
  'production' => :red,
  'staging' => :cyan,
  'development' => :green,
  'test' => :magenta
}.freeze

# rubocop:disable Layout/HeredocIndentation
# Generated this using the larry3d font selection. You have to replace/escape
# the backslashes
#
# https://onlineasciitools.com/convert-text-to-ascii-art
DEVELOPMENT_BANNER = <<~BANNER

  __                          ___                                              __
 /\\ \\                        /\\_ \\                                            /\\ \\__
 \\_\\ \\     __   __  __     __\\//\\ \\     ___   _____     ___ ___      __    ___\\ \\ ,_\\
 /'_` \\  /'__`\\/\\ \\/\\ \\  /'__`\\\\ \\ \\   / __`\\/\\ '__`\\ /' __` __`\\  /'__`\\/' _ `\\ \\ \\/
/\\ \\L\\ \\/\\  __/\\ \\ \\_/ |/\\  __/ \\_\\ \\_/\\ \\L\\ \\ \\ \\L\\ \\/\\ \\/\\ \\/\\ \\/\\  __//\\ \\/\\ \\ \\ \\_
\\ \\___,_\\ \\____\\\\ \\___/ \\ \\____\\/\\____\\ \\____/\\ \\ ,__/\\ \\_\\ \\_\\ \\_\\ \\____\\ \\_\\ \\_\\ \\__\\
 \\/__,_ /\\/____/ \\/__/   \\/____/\\/____/\\/___/  \\ \\ \\/  \\/_/\\/_/\\/_/\\/____/\\/_/\\/_/\\/__/
                                                \\ \\_\\
                                                 \\/_/

BANNER

STAGING_BANNER = <<~BANNER

       __
      /\\ \\__                  __
  ____\\ \\ ,_\\    __       __ /\\_\\    ___      __
 /',__\\\\ \\ \\/  /'__`\\   /'_ `\\/\\ \\ /' _ `\\  /'_ `\\
/\\__, `\\\\ \\ \\_/\\ \\L\\.\\_/\\ \\L\\ \\ \\ \\/\\ \\/\\ \\/\\ \\L\\ \\
\\/\\____/ \\ \\__\\ \\__/.\\_\\ \\____ \\ \\_\\ \\_\\ \\_\\ \\____ \\
 \\/___/   \\/__/\\/__/\\/_/\\/___L\\ \\/_/\\/_/\\/_/\\/___L\\ \\
                          /\\____/             /\\____/
                          \\_/__/              \\_/__/

BANNER

PRODUCTION_BANNER = <<~BANNER

                        __                  __
                       /\\ \\                /\\ \\__  __
 _____   _ __   ___    \\_\\ \\  __  __    ___\\ \\ ,_\\/\\_\\    ___     ___
/\\ '__`\\/\\`'__\\/ __`\\  /'_` \\/\\ \\/\\ \\  /'___\\ \\ \\/\\/\\ \\  / __`\\ /' _ `\\
\\ \\ \\L\\ \\ \\ \\//\\ \\L\\ \\/\\ \\L\\ \\ \\ \\_\\ \\/\\ \\__/\\ \\ \\_\\ \\ \\/\\ \\L\\ \\/\\ \\/\\ \\
 \\ \\ ,__/\\ \\_\\\\ \\____/\\ \\___,_\\ \\____/\\ \\____\\\\ \\__\\\\ \\_\\ \\____/\\ \\_\\ \\_\\
  \\ \\ \\/  \\/_/ \\/___/  \\/__,_ /\\/___/  \\/____/ \\/__/ \\/_/\\/___/  \\/_/\\/_/
   \\ \\_\\
    \\/_/

BANNER

TEST_BANNER = <<~BANNER

 __                   __
/\\ \\__               /\\ \\__
\\ \\ ,_\\    __    ____\\ \\ ,_\\
 \\ \\ \\/  /'__`\\ /',__\\\\ \\ \\/
  \\ \\ \\_/\\  __//\\__, `\\\\ \\ \\_
   \\ \\__\\ \\____\\/\\____/ \\ \\__\\
    \\/__/\\/____/\\/___/   \\/__/

BANNER
# rubocop:enable Layout/HeredocIndentation

# This will actually only hit dev, because that's all I run locally. Leaving this here
# for now because it's kind of neat and I might use it for something else later
def rails_banner
  env = defined?(Rails) ? Rails.env : 'development'

  puts Pry::Helpers::Text.__send__(ENV_COLORS[env], Object.const_get("#{env.upcase}_BANNER")) # rubocop:disable Rails/Output

  ''
end

# https://github.com/smridge/dotfiles/blob/master/.pryrc#L31-L43
def formatted_env
  return 'pry' unless defined?(Rails)

  Pry::Helpers::Text.__send__(ENV_COLORS[Rails.env], Rails.env)
end

# Load factorybot in a rails console
def fb
  require 'factory_bot'
  require 'faker'

  FactoryBot.definition_file_paths << File.join('spec', 'support', 'factories') if Dir.exist?(File.join('spec', 'support', 'factories'))
  FactoryBot.definition_file_paths << File.join('spec', 'factories') if Dir.exist?(File.join('spec', 'factories'))

  FactoryBot.factories.clear
  FactoryBot.find_definitions

  include FactoryBot::Syntax::Methods # rubocop:disable Style/MixinUsage
end

# Show X lines before and after the exception line
Pry.config.default_window_size = 14

Pry.config.editor = 'nvim'

Pry.config.pager = true

if Pry::Prompt.respond_to?(:new)
  # These are new pry version settings. We're using the old version in some places
  Pry.config.history_file = './.pry_history'
  Pry.config.history_should_load = true

  Pry.config.prompt = Pry::Prompt.new(
    'ruby',
    'My custom prompt with Nerdfonts',
    [
      proc { |_obj, _nest_level, _| "pry \001\e[31m\002\001\e[0m\002 " },
      proc { |_obj, _nest_level, _| '    | ' }
    ]
  )
else
  Pry.config.history.file = './.pry_history'
  Pry.config.history.should_load = true

  Pry.config.prompt = [
    proc { |_obj, _nest_level, _| "pry \001\e[31m\002\001\e[0m\002 " },
    proc { |_obj, _nest_level, _| '    | ' }
  ]
end

Pry.config.exec_string = rails_banner

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

Pry::Commands.command(/^$/, 'repeat last command') do
  _pry_.run_command Pry.history.to_a.last
end

# https://github.com/pry/pry/issues/1619
Pry.config.collision_warning = true

extend Rails::ConsoleMethods if defined?(Rails) && Rails.env # rubocop:disable Style/MixinUsage
