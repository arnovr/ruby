# frozen_string_literal: true
require 'infrastructure/hypermedia/url'

module Infrastructure
  module Hypermedia
    class Self
      def initialize(url)
        @url = Url.new(url)
      end

      def to_hash
        {
          'self' => @url.to_hash
        }
      end
    end
  end
end
