require 'rspec'
require 'webmock/rspec'
require 'pry'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    PlanGridWeb::App
  end

  config.mock_with :mocha
  config.color = true
  config.only_failures
end
