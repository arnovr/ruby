# frozen_string_literal: true
require 'entity/event_recorder'
require 'entity/events/artist_deleted_event'
require 'entity/events/artist_created_event'

module Entity
  class Artist
    include Entity::EventRecorder
    attr_reader :id
    attr_reader :artist

    def initialize(id, artist)
      @id = id
      @artist = artist
    end

    def delete
      record Entity::Events::ArtistDeletedEvent.new(id)
    end

    def to_hash
      {
        'id' => @id,
        'artist' => @artist
      }
    end

    def self.create_with_name(name)
      artist = Artist.new(nil, name)
      artist.record Entity::Events::ArtistCreatedEvent.new(name)
      artist
    end
  end
end
