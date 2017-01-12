# frozen_string_literal: true
module Entity
  class TrackRepository
    def find_by_id(_id)
      raise NotImplementedError, 'Implement this method in a child class'
    end

    def find_by_album_id(_id)
      raise NotImplementedError, 'Implement this method in a child class'
    end
  end
end
