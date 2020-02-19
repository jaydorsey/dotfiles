# -*-ruby -*-

# frozen_string_literal: true

### START debundle.rb ###

# MIT License
# Copyright (c) Conrad Irwin <conrad.irwin@gmail.com>
# Copyright (c) Jan Lelis <mail@janlelis.de>

module Debundle
  VERSION = "1.1.0"

  def self.debundle!
    return unless defined?(Bundler)
    return unless Gem.post_reset_hooks.reject!{ |hook|
      hook.source_location.first =~ %r{/bundler/}
    }
    if defined? Bundler::EnvironmentPreserver
      ENV.replace(Bundler::EnvironmentPreserver.new(ENV, %w[GEM_PATH]).backup)
    end
    Gem.clear_paths

    load 'rubygems/core_ext/kernel_require.rb'
    load 'rubygems/core_ext/kernel_gem.rb'
  rescue
    warn "DEBUNDLE.RB FAILED"
    raise
  end
end

Debundle.debundle!

### END debundle.rb ###



# rubocop:disable Rails/Output, Lint/SuppressedException, Style/MixinUsage, Style/CommandLiteral
print 'Loading ~/.irbrc...'

begin
  require 'irb'
rescue LoadError => _e
  puts "Failed loading"
end

# begin
#   require 'irb/completion'
# rescue LoadError => _e
# end

# begin
#   require 'irb/ext/save-history'
# rescue LoadError => _e
# end

begin
  require 'benchmark'
rescue LoadError => _e
end

begin
  require 'benchmark/ips'
rescue LoadError => _e
end

begin
  require 'benchmark/memory'
rescue LoadError => _e
end

begin
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError => _e
end

begin
  require 'ap'
rescue LoadError => _e
end

IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
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

puts ' loaded!'
# rubocop:enable Rails/Output, Lint/SuppressedException, Style/MixinUsage, Style/CommandLiteral
