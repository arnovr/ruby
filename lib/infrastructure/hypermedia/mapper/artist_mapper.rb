# frozen_string_literal: true
module Infrastructure
  module Hypermedia
    module Mapper
      class ArtistMapper
        def initialize(artist_collection, base_uri)
          @artist_collection = artist_collection
          @base_uri = base_uri
        end

        def to_hash
          @artist_collection.each.collect do |artist|
            {
              'href' => @base_uri + '/artist/' + artist.id.to_s,
              'artist' => artist.artist
            }
          end
        end
      end
    end
  end
end
