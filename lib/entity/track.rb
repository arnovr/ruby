# frozen_string_literal: true
module Entity
  class Track
    attr_reader :id, :track, :album_id

    def initialize(id, track, album_id)
      @id = id
      @track = track
      @album_id = album_id
    end

    def to_hash
      {
        'id' => @id,
        'track' => @track
      }
    end
  end
end
