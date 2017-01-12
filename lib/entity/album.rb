# frozen_string_literal: true
module Entity
  class Album
    attr_reader :id, :album, :artist_id

    def initialize(id, name, artist_id)
      @id = id
      @album = name
      @artist_id = artist_id
    end

    def to_hash
      {
        'id' => @id,
        'album' => @album
      }
    end
  end
end
