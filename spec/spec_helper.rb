require 'rack/test'
require 'rspec'
require 'sinatra'
require 'active_record'
require 'capybara/rspec'
require 'capybara/dsl'

ENV['SINATRA_ENV'] = 'test'

require File.expand_path('../models/user_spec', __FILE__)
require File.expand_path('../features/user_feature_spec', __FILE__)
require File.expand_path('../controllers/app_spec', __FILE__)
require File.expand_path('../../app', __FILE__)

#
module RSpecMixin
  include Rack::Test::Methods

  def app
    # Sinatra::Application
    Rack::Builder.parse_file('config.ru').first
    # Capybara.app = Sinatra::Application
  end

end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include Rack::Test::Methods
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.app = app
  Capybara.register_driver :rack_test do |app|
    Capybara::RackTest::Driver.new(app, :headers => { 'HTTP_USER_AGENT' => 'Capybara' })
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
