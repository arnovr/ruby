# frozen_string_literal: true
module Infrastructure
  module Hypermedia
    module Mapper
      class TrackMapper
        def initialize(track_collection, base_uri)
          @track_collection = track_collection
          @base_uri = base_uri
        end

        def to_hash
          @track_collection.each.collect do |track|
            {
              'href' => @base_uri + 'track/' + track.id.to_s,
              'track' => track.track
            }
          end
        end
      end
    end
  end
end
