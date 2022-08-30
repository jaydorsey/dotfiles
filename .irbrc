# frozen_string_literal: true

# -*- mode: ruby -*- vim:set ft=ruby:
#
# rubocop:disable Lint/SuppressedException, Style/MixinUsage, Style/CommandLiteral
# begin
#   require "pry"
#   Pry.start
#   exit
# rescue LoadError => e
#   warn "=> Unable to load pry"
# end

if defined?(StructuredWarnings)
  StructuredWarnings::StandardWarning.disable
  StructuredWarnings::BuiltInWarning.disable
end

begin
  require 'irb/completion'
rescue LoadError => _e
end

begin
  require 'irb/ext/save-history'
rescue LoadError => _e
end

begin
  require 'benchmark'
rescue LoadError => _e
end

begin
  require 'benchmark/ips'
rescue LoadError => _e
  puts 'gem install benchmark-ips'
end

begin
  require 'benchmark/memory'
rescue LoadError => _e
  puts 'gem install benchmark-memory'
end

# begin
#   require 'wirble'
#
#   Wirble.init
#   Wirble.colorize
# rescue LoadError => _e
#   puts 'gem install wirble'
# end

begin
  require 'ap'
rescue LoadError => _e
  puts 'gem install ap'
end

IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = './.irb-history'

# https://ruby-doc.org/stdlib-2.7.0/libdoc/irb/rdoc/IRB.html#module-IRB-label-Auto+indentation
IRB.conf[:PROMPT][:CUSTOM] = {
  PROMPT_I: "irb \001\e[31m\002 |>\001\e[0m\002 ", # normal prompt
  PROMPT_S: "... \001\e[31m\002 |>\001\e[0m\002 ", # continued strings
  PROMPT_C: "... \001\e[31m\002 |>\001\e[0m\002 ", # continued statement
  PROMPT_N: '.. ', # indenting code
  RETURN: "=> %s\n" # return value
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
IRB.conf[:AUTO_INDENT] = true

def bm(times = 20)
  require 'benchmark'
  ret = nil
  Benchmark.bm do |x|
    x.report do
      times.times { ret = yield }
    end
  end

  ret
end

# Enable factory creation locally from a `rails console` after
# running this method
def fb
  require 'factory_bot'
  require 'faker'

  FactoryBot.definition_file_paths << File.join('spec', 'support', 'factories')
  FactoryBot.find_definitions

  include FactoryBot::Syntax::Methods
end

def ls
  %x(ls).split('\n')
end
# rubocop:enable Lint/SuppressedException, Style/MixinUsage, Style/CommandLiteral
