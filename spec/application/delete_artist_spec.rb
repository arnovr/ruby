# frozen_string_literal: true
require 'application/delete_artist'
require 'entity/artist'
require 'entity/events/artist_deleted_event'

describe 'DeleteArtist' do
  describe 'Delete an artist' do
    it 'should receive artistdeletedevent on the eventbus' do
      artist = Entity::Artist.new(1, 'hello')
      artist_repository = double('artist_repository')
      event_bus = double('event_bus')

      allow(artist_repository).to receive(:find_by_id).and_return([artist])

      expect(event_bus).to receive(:handle).with([kind_of(Entity::Events::ArtistDeletedEvent)])

      delete_artist = Application::DeleteArtist.new(artist_repository, event_bus)
      delete_artist.execute 1
    end
  end
end
