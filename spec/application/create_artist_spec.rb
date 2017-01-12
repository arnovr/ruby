# frozen_string_literal: true
require 'application/create_artist'
require 'entity/artist'
require 'entity/events/artist_created_event'

describe 'CreateArtist' do
  describe 'Create an artist' do
    it 'should receive artist created event on the event bus' do
      event_bus = double('event_bus')

      expect(event_bus).to receive(:handle).with([kind_of(Entity::Events::ArtistCreatedEvent)])

      create_artist = Application::CreateArtist.new(event_bus)
      create_artist.execute 1
    end
  end
end
