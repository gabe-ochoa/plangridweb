require ::File.expand_path('../config/environment.rb',  __FILE__)

module PlanGridWeb
  class App < Sinatra::Base

    get '/' do
      return [200, '<p>Hello, World</p>']
    end
  end
end

