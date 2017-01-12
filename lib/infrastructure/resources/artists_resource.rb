# frozen_string_literal: true
require 'webmachine'
require 'json'
require 'entity/artist'
require 'infrastructure/hypermedia/links'
require 'infrastructure/hypermedia/relation'
require 'infrastructure/hypermedia/mapper/track_mapper'
require 'infrastructure/hypermedia/mapper/album_mapper'

module Infrastructure
  module Resources
    class ArtistResource < Webmachine::Resource
      def allowed_methods
        %w(GET POST DELETE)
      end

      def content_types_accepted
        [['application/hal+json', :from_json]]
      end

      def content_types_provided
        [['application/hal+json', :to_json]]
      end

      def post_is_create?
        true
      end

      def resource_exists?
        return true if request.method == 'POST'

        artist
      end

      def delete_resource
        Infrastructure::Container.application_delete_artist.execute(request.path_info[:id])
        true
      end

      def create_path
        "/artist/#{next_id}"
      end

      def next_id
        @id ||= Infrastructure::Container.artist_repository.next_id
      end

      def param
        JSON.parse(request.body.to_s)
      end

      def from_json
        Infrastructure::Container.application_create_artist.execute param['artist']
        response.body = {}
      end

      def to_json
        links = Infrastructure::Hypermedia::Links.new(
          request.base_uri + request.routing_tokens.join('/'),
          album_relation
        )
        JSON.dump artist.to_hash.merge(links)
      end

      private

      def album_relation
        Infrastructure::Hypermedia::Relation.new(
          'albums',
          Infrastructure::Hypermedia::Mapper::AlbumMapper.new(
            Infrastructure::Container.album_repository.find_by_id(
              request.path_info[:id]
            ),
            request.base_uri
          )
        )
      end

      def artist
        @artist ||= Infrastructure::Container.artist_repository.find_by_id(request.path_info[:id]).first
      end
    end
  end
end
