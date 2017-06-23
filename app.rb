require ::File.expand_path('../config/environment.rb',  __FILE__)

module PlanGridWeb
  class App < Base

    get'/', provides: 'text/html' do
      return hello_world_response
    end

    private

    def hello_world_response
      [200, '<p>Hello, World</p>']
    end
  end
end

