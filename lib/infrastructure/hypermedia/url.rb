# frozen_string_literal: true
module Infrastructure
  module Hypermedia
    class Url
      def initialize(url)
        @url = url
      end

      def to_hash
        {
          'href' => @url
        }
      end
    end
  end
end
