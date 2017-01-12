# frozen_string_literal: true
require 'infrastructure/hypermedia/self'
module Infrastructure
  module Hypermedia
    class Relation
      def initialize(name, data)
        @album = name
        @data = data
      end

      def to_hash
        {
          @album => @data.to_hash
        }
      end
    end
  end
end
