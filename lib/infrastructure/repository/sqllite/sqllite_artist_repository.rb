# frozen_string_literal: true
require 'entity/artist'
require 'entity/artist_repository'

module Infrastructure
  module Repository
    module Sqllite
      class SQLLiteArtistRepository < Entity::ArtistRepository
        def initialize(db)
          @db = db
        end

        def find_by_id(id)
          artists = []
          @db.execute('select * from artists WHERE id = ?', id) do |row|
            artists << Entity::Artist.new(*row)
          end
          artists
        end

        def next_id
          @db.execute('select id from artists ORDER BY id DESC LIMIT 1') do |row|
            return row[0] + 1
          end
        end

        def save(artist)
          @db.execute 'insert into artists (name) VALUES (?)', [artist.artist]
        end

        def delete(id)
          @db.execute 'DELETE FROM artists WHERE id = ?', [id]
        end
      end
    end
  end
end
