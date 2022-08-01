# Required for rspec/rails
require 'action_view'
require 'action_dispatch'
require 'action_controller'

# It may be possible to import only part of rspec/rails
require 'rspec/rails'
require 'rspec-html-matchers'

require "bundler/setup"
require "bulma_form_builder"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include RSpecHtmlMatchers
end
