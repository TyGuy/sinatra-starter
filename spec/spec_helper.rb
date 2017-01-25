require 'rack/test'
require 'rspec'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../all_requires', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class
  end
end

RSpec.configure do |config|
  # This is for Rack "controller" tests in Sinatra
  config.include RSpecMixin

  # This causes the host group and examples to inherit metadata
  # from the shared context.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # DB stuff:
  DatabaseCleaner.strategy = :transaction
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
