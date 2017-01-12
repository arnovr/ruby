# frozen_string_literal: true
require 'entity/album'
require 'entity/album_repository'
require 'infrastructure/repository/sqllite/sqllite_artist_repository'

module Infrastructure
  module Repository
    module Sqllite
      class SQLLiteAlbumRepository < Entity::AlbumRepository
        def initialize(db, artist_repository)
          @db = db
          @artist_repository = artist_repository
        end

        def find_by_id(id)
          albums = []
          @db.execute('select * from albums WHERE id = ?', id) do |row|
            albums << Entity::Album.new(*row)
          end
          albums
        end
      end
    end
  end
end
