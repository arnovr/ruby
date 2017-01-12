# frozen_string_literal: true
module Entity
  class AlbumRepository
    def find_by_id(_id)
      raise NotImplementedError, 'Implement this method in a child class'
    end
  end
end
