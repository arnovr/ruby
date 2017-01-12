# frozen_string_literal: true
require 'webmachine'
require 'infrastructure/container'
require 'infrastructure/hypermedia/links'
require 'infrastructure/hypermedia/relation'
require 'infrastructure/hypermedia/mapper/track_mapper'
require 'infrastructure/hypermedia/mapper/artist_mapper'

module Infrastructure
  module Resources
    class AlbumResource < Webmachine::Resource
      def allowed_methods
        ['GET']
      end

      def content_types_provided
        [['application/hal+json', :to_json]]
      end

      def resource_exists?
        album
      end

      def to_json
        links = Infrastructure::Hypermedia::Links.new(
          request.base_uri + request.routing_tokens.join('/'),
          track_relation,
          artist_relation
        )
        JSON.dump album.to_hash.merge(links)
      end

      def artist_relation
        Infrastructure::Hypermedia::Relation.new(
          'artists',
          Infrastructure::Hypermedia::Mapper::ArtistMapper.new(
            Infrastructure::Container.artist_repository.find_by_id(
              request.path_info[:id]
            ),
            request.base_uri
          )
        )
      end

      def track_relation
        Infrastructure::Hypermedia::Relation.new(
          'tracks',
          Infrastructure::Hypermedia::Mapper::TrackMapper.new(
            Infrastructure::Container.track_repository.find_by_album_id(
              request.path_info[:id]
            ),
            request.base_uri
          )
        )
      end

      private

      def album
        @albums ||= Infrastructure::Container.album_repository.find_by_id(request.path_info[:id]).first
      end
    end
  end
end
