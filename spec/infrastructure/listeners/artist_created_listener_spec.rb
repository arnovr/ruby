# frozen_string_literal: true
require 'infrastructure/listeners/artist_created_listener'
require 'entity/events/artist_created_event'
require 'entity/artist'

describe 'ArtistCreatedListener' do
  describe 'Handle event' do
    it 'should save the artist to the repository' do
      artist_repository = double('artist_repository')
      listener = Infrastructure::Listeners::ArtistCreatedListener.new(artist_repository)

      expect(artist_repository).to receive(:save).with(kind_of(Entity::Artist))

      listener.handle(
        Entity::Events::ArtistCreatedEvent.new('test')
      )
    end

    it 'should not handle unknown events' do
      artist_repository = double('artist_repository')
      listener = Infrastructure::Listeners::ArtistCreatedListener.new(artist_repository)

      expect(artist_repository).to_not receive(:save)

      listener.handle(
        double('unknown_event')
      )
    end
  end
end
