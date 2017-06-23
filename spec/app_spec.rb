require 'spec_helper'
require_relative '../app'

RSpec.describe PlanGridWeb::App, type: :controllers do

  describe "An index endpoint '/' where" do

    it "GET with an accept header of 'text/html' returns a hello world paragraph" do
      header 'Accept', 'text/html'
      get '/'

      expect(last_response.status).to be 200
      expect(last_response.body).to eq('<p>Hello, World</p>')
    end

    it "GET with an accept header of 'text/html' returns a json message saying good morning" do
      header 'Accept', 'application/json'
      get '/'

      expect(last_response.status).to be 200
      expect(last_response.body).to eq('{"message":"Good morning"}')
    end

    context "POST with a JSON body" do
      let(:json_body) do
        json_body = {
          foo: 'value_foo',
          bar: 'value_bar'
          }.to_json
      end

      it "when ENV['SERVER_MODE'] is 'true' return the value for the key 'foo'" do
        ENV['SERVER_MODE'] = 'true'
        post '/', json_body

        expect(last_response.status).to be 202
        expect(last_response.body).to eq('value_foo')
      end
    end
  end
end
