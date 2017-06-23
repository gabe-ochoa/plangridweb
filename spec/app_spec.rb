require 'spec_helper'
require_relative '../app'
require 'json'

RSpec.describe PlanGridWeb::App, type: :controllers do

  before(:each) do
    ENV['SERVER_MODE'] = nil
  end

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
      let(:test_body) do
        test_body = {
          foo: 'value_foo',
          bar: 'value_bar'
          }.to_json
      end

      it "when ENV['SERVER_MODE'] is 'true' return the value for the key 'foo'" do
        ENV['SERVER_MODE'] = 'true'
        post '/', test_body

        expect(last_response.status).to be 202
        expect(last_response.body).to eq('value_foo')
      end

      it "when ENV['SERVER_MODE'] is 'false' return the value for the key 'bar'" do
        ENV['SERVER_MODE'] = 'false'
        post '/', test_body

        expect(last_response.status).to be 202
        expect(last_response.body).to eq('value_bar')
      end

      it "when ENV['SERVER_MODE'] is not 'true', 'false', or nil let the client know the server is misconfigured" do
        ENV['SERVER_MODE'] = 'bad mode'
        post '/', test_body

        expect(last_response.status).to be 500
        expect(last_response.body).to eq("The server is misconfigured! Server mode 'bad mode' not supported")
      end

      it "when ENV['SERVER_MODE'] is nil let the client know the server mode needs to be set" do
        post '/', test_body

        expect(last_response.status).to be 500
        expect(last_response.body).to eq("The server mode needs to be set!")
      end
    end
  end
end
