# frozen_string_literal: true
require 'webmachine/test'
require 'webapp'
require 'rspec/json_expectations'

describe 'WebApp' do
  include Webmachine::Test

  let(:app) do
    WebApp
  end

  describe 'Track Resource' do
    it 'should reply with the correct track' do
      get '/track/1'

      expect(response.code).to equal(200)
      expect(response.body).to include_json(
        track: 'Hello'
      )
    end
    it 'has a reference to itself' do
      get '/track/1'

      expect(response.body).to include_json(
        "_links": {
          "self": {
            "href": 'http://localhost/track/1'
          }
        }
      )
    end
    it 'has its corresponding albums' do
      get '/track/1'

      expect(response.body).to include_json(
        "_links": {
          "albums": [
            {
              "href": 'http://localhost/album/1',
              "album": 'Hello'
            }
          ]
        }
      )
    end
    it 'has its corresponding artists' do
      get '/track/1'

      expect(response.body).to include_json(
        "_links": {
          "artists": [
            {
              "href": 'http://localhost/artist/1', "artist": 'Adele'
            }
          ]
        }
      )
    end
  end
end
