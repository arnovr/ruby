# frozen_string_literal: true
require 'infrastructure/repository/sqllite/sqllite_artist_repository'
require 'infrastructure/repository/sqllite/sqllite_album_repository'
require 'infrastructure/repository/sqllite/sqllite_track_repository'
require 'application/delete_artist'
require 'application/create_artist'
require 'infrastructure/listeners/artist_deleted_listener'
require 'infrastructure/listeners/artist_created_listener'
require 'infrastructure/event_bus'

module Infrastructure
  class Container
    def self.db
      SQLite3::Database.new 'music.db'
    end

    def self.artist_repository
      Infrastructure::Repository::Sqllite::SQLLiteArtistRepository.new(db)
    end

    def self.track_repository
      Infrastructure::Repository::Sqllite::SQLLiteTrackRepository.new(db)
    end

    def self.album_repository
      Infrastructure::Repository::Sqllite::SQLLiteAlbumRepository.new(db, artist_repository)
    end

    def self.event_bus
      Infrastructure::EventBus.new(
        Infrastructure::Listeners::ArtistDeletedListener.new(artist_repository),
        Infrastructure::Listeners::ArtistCreatedListener.new(artist_repository)
      )
    end

    def self.application_create_artist
      Application::CreateArtist.new(event_bus)
    end

    def self.application_delete_artist
      Application::DeleteArtist.new(artist_repository, event_bus)
    end
  end
end
