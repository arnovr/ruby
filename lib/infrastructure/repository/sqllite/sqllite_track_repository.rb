# frozen_string_literal: true
require 'entity/track'
require 'entity/track_repository'

module Infrastructure
  module Repository
    module Sqllite
      class SQLLiteTrackRepository < Entity::TrackRepository
        def initialize(db)
          @db = db
        end

        def find_by_id(id)
          tracks = []
          @db.execute('select id, name, album_id from tracks WHERE id = ?', id) do |row|
            tracks << Entity::Track.new(*row)
          end
          tracks
        end

        def find_by_album_id(id)
          tracks = []
          @db.execute('select id, name, album_id from tracks WHERE album_id = ?', id) do |row|
            tracks << Entity::Track.new(*row)
          end
          tracks
        end
      end
    end
  end
end
