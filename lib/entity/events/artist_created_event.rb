# frozen_string_literal: true
module Entity
  module Events
    class ArtistCreatedEvent
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
  end
end
