require ::File.expand_path('../config/environment.rb',  __FILE__)

module PlanGridWeb
  class App < Base

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
        return [202, body['foo']]
      elsif mode.eql?('false')
        return [202, body['bar']]
      else
        return [500, "The server is misconfigured! Server mode '#{mode}' not supported"]
      end
    end

    private

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

