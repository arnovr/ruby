# frozen_string_literal: true
require 'entity/artist_repository'

module Application
  class DeleteArtist
    def initialize(artist_repository, event_bus)
      @artist_repository = artist_repository
      @event_bus = event_bus
    end

    def execute(id)
      artist = @artist_repository.find_by_id(id).first
      artist.delete

      events = artist.recorded_events

      @event_bus.handle events
    end
  end
end
