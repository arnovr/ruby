# frozen_string_literal: true
require 'entity/events/artist_deleted_event'

module Infrastructure
  module Listeners
    class ArtistDeletedListener
      def initialize(artist_repository)
        @artist_repository = artist_repository
      end

      def handle(event)
        return unless event.instance_of?(Entity::Events::ArtistDeletedEvent)

        @artist_repository.delete(event.id)
      end
    end
  end
end
