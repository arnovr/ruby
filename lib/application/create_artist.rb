# frozen_string_literal: true
require 'entity/artist_repository'
require 'entity/artist'

module Application
  class CreateArtist
    def initialize(event_bus)
      @event_bus = event_bus
    end

    def execute(name)
      artist = Entity::Artist.create_with_name(name)

      events = artist.recorded_events

      @event_bus.handle events
    end
  end
end
