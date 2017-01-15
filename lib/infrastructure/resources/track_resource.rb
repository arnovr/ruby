# frozen_string_literal: true
require 'webmachine'
require 'json'
require 'infrastructure/hypermedia/links'
require 'infrastructure/hypermedia/relation'
require 'infrastructure/hypermedia/mapper/track_mapper'
require 'infrastructure/hypermedia/mapper/album_mapper'

module Infrastructure
  module Resources
    class TrackResource < Webmachine::Resource
      def allowed_methods
        ['GET']
      end

      def content_types_provided
        [['application/hal+json', :to_json]]
      end

      def resource_exists?
        track
      end

      def to_json
        links = Infrastructure::Hypermedia::Links.new(
          request.base_uri + request.routing_tokens.join('/'),
          album_relation,
          artist_relation
        )
        JSON.dump track.to_hash.merge(links)
      end

      def album_relation
        Infrastructure::Hypermedia::Relation.new(
          'albums',
          Infrastructure::Hypermedia::Mapper::AlbumMapper.new(
            Infrastructure::Container.album_repository.find_by_id(
              track.album_id.to_s
            ),
            request.base_uri
          )
        )
      end

      def artist_relation
        Infrastructure::Hypermedia::Relation.new(
          'artists',
          Infrastructure::Hypermedia::Mapper::ArtistMapper.new(
            artists,
            request.base_uri
          )
        )
      end

      def artists
        Infrastructure::Container.artist_repository.find_by_id(
          Infrastructure::Container.album_repository.find_by_id(
            track.album_id.to_s
          ).first.artist_id.to_s
        )
      end

      private

      def track
        @track ||= Infrastructure::Container.track_repository.find_by_id(request.path_info[:id]).first
      end
    end
  end
end
