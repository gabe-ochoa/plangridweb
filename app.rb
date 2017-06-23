require ::File.expand_path('../config/environment.rb',  __FILE__)

module PlanGridWeb
  class App < Sinatra::Base
    use Rack::Logger

    # Hello World response
    get '/', provides: 'text/html' do
      return hello_world_response
    end

    # Good morning response
    get '/', provides: 'application/json' do
      return good_morning_response
    end

    # Check server mode
    post '/' do
      body = JSON.parse(request.body.read)
      if mode.eql?('true')
        value = body['foo']
        return [202, value]
        logger.info(value)
      elsif mode.eql?('false')
        value = body['bar']
        return [202, value]
        logger.info(value)
      elsif mode.nil?
        return [500, "The server mode needs to be set!"]
      else
        return [500, "The server is misconfigured! Server mode '#{mode}' not supported"]
      end
    end

    private

    # attr_reader :logger

    def logger
      @logger = Logger.new(stdout)
      @logger.level = Logger::INFO
    end

    def mode
      ENV['SERVER_MODE']
    end

    def good_morning_response
      [200, { message: 'Good morning'}.to_json ]
    end

    def hello_world_response
      [200, '<p>Hello, World</p>']
    end
  end
end

