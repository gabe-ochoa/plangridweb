# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about

require 'sinatra/base'
require 'logger'
require 'json'

require './app'
module PlanGridWeb
  def logger
    @logger ||= Rack::Logger.new(STDOUT)
  end
end

