require 'spec_helper'
require_relative '../app'

RSpec.describe PlanGridWeb::App, type: :controllers do
  include Rack::Test::Methods

  describe "An index endpoint '/' where" do

    it 'GET returns a hello world paragraph' do
      get('/')
      expect(last_response.status).to be 200
      expect(last_response.body).to eq('<p>Hello, World</p>')
    end
  end
end
