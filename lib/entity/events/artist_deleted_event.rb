# frozen_string_literal: true
module Entity
  module Events
    class ArtistDeletedEvent
      attr_reader :id
      def initialize(id)
        @id = id
      end
    end
  end
end
