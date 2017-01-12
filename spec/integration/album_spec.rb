# frozen_string_literal: true
require 'webmachine/test'
require 'webapp'
require 'rspec/json_expectations'

describe 'WebApp' do
  include Webmachine::Test

  let(:app) do
    WebApp
  end

  describe 'Album Resource' do
    it 'should reply with the correct album' do
      get '/album/1'

      expect(response.code).to equal(200)
      expect(response.body).to include_json(
        album: 'Hello'
      )
    end
    it 'has a reference to itself' do
      get '/album/1'

      expect(response.body).to include_json(
        "_links": {
          "self": {
            "href": 'http://localhost/album/1'
          }
        }
      )
    end
    it 'has its corresponding tracks' do
      get '/album/1'

      expect(response.body).to include_json(
        "_links": {
          "tracks": [
            { "href": 'http://localhost/track/1', "track": 'Hello' },
            { "href": 'http://localhost/track/2', "track": 'And bye' }
          ]
        }
      )
    end
    it 'has its corresponding artists' do
      get '/album/1'

      expect(response.body).to include_json(
        "_links": {
          "artists": [
            {
              "href": 'http://localhost/artist/1',
              "artist": 'Adele'
            }
          ]
        }
      )
    end
  end
end
