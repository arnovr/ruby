# frozen_string_literal: true
require 'entity/events/artist_created_event'
require 'entity/artist'

module Infrastructure
  module Listeners
    class ArtistCreatedListener
      def initialize(artist_repository)
        @artist_repository = artist_repository
      end

      def handle(event)
        return unless event.instance_of?(Entity::Events::ArtistCreatedEvent)

        @artist_repository.save(Entity::Artist.new(nil, event.name))
      end
    end
  end
end
