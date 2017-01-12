# frozen_string_literal: true
require 'webmachine'
require 'sqlite3'
require 'infrastructure/repository/sqllite/sqllite_album_repository'
require 'infrastructure/resources/album_resource'
require 'infrastructure/resources/track_resource'
require 'infrastructure/resources/artists_resource'

WebApp = Webmachine::Application.new do |app|
  app.routes do
    add ['album', :id], Infrastructure::Resources::AlbumResource
    add ['artist'], Infrastructure::Resources::ArtistResource
    add ['artist', :id], Infrastructure::Resources::ArtistResource
    add ['track', :id], Infrastructure::Resources::TrackResource
  end
end
