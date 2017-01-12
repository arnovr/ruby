# frozen_string_literal: true
module Infrastructure
  module Hypermedia
    module Mapper
      class AlbumMapper
        def initialize(album_collection, base_uri)
          @album_collection = album_collection
          @base_uri = base_uri
        end

        def to_hash
          @album_collection.each.collect do |album|
            {
              'href' => @base_uri + 'album/' + album.id.to_s,
              'album' => album.album
            }
          end
        end
      end
    end
  end
end
