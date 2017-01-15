# frozen_string_literal: true
require 'webmachine/test'
require 'webapp'
require 'rspec/json_expectations'

describe 'WebApp' do
  include Webmachine::Test

  let(:app) do
    WebApp
  end

  describe 'Artist resource' do
    it 'should reply with the correct artist' do
      get '/artist/1'

      expect(response.code).to equal(200)
      expect(response.body).to include_json(
        artist: 'Adele'
      )
    end
    it 'has a reference to itself' do
      get '/artist/1'

      expect(response.body).to include_json(
        "_links": {
          "self": {
            "href": 'http://localhost/artist/1'
          }
        }
      )
    end
    it 'has its corresponding albums' do
      get '/artist/1'

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

    it 'create an artist' do
      payload = '{
          "artist": "Masters of the Universe"
      }'
      header('Content-Type', 'application/hal+json')
      body(payload)

      post '/artist'

      expect(response.code).to equal(201)

      get response.headers['Location']

      expect(response.code).to equal(200)
      expect(response.body).to include_json(
        artist: 'Masters of the Universe'
      )
    end

    it 'delete an artist' do
      header('Content-Type', 'application/hal+json')

      delete '/artist/1'

      expect(response.code).to equal(204)

      get '/artist/1'

      expect(response.code).to equal(404)

      # reload database after delete, this should be fixed more properly
      load 'setup_db.rb'
    end
  end
end
