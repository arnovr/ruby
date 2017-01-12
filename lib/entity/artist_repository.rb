# frozen_string_literal: true
module Entity
  class ArtistRepository
    def find_by_id(_id)
      raise NotImplementedError, 'Implement this method in a child class'
    end

    def next_id
      raise NotImplementedError, 'Implement this method in a child class'
    end

    def save(_artist)
      raise NotImplementedError, 'Implement this method in a child class'
    end

    def delete(_id)
      raise NotImplementedError, 'Implement this method in a child class'
    end
  end
end
