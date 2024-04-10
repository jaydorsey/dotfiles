# frozen_string_literal: true

Spring.quiet = true

Spring.after_fork do
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection # Establish connection is not needed for Rails 5.2+ https://github.com/rails/rails/pull/31241
  end

  if Rails.env.test? && defined?(RSpec)
    RSpec.configure do |config|
      seed_index = ARGV.index { |x| x =~ /seed/ }

      config.seed =
        if seed_index
          ARGV[seed_index + 1].to_i
        else
          srand % 0xFFFF
        end
    end
  end
end
