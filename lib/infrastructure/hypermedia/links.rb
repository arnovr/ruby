# frozen_string_literal: true
require 'infrastructure/hypermedia/self'
module Infrastructure
  module Hypermedia
    class Links
      def initialize(url, *relations)
        @self = Self.new(url)
        @relations = relations
      end

      def to_hash
        relations = {}

        @relations.each do |relation|
          relations.merge!(relation.to_hash)
        end
        {
          '_links' => @self.to_hash.merge!(relations)
        }
      end
    end
  end
end
