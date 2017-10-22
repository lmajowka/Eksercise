module Services
  module Eksercise
    class SearchHelper

      MAXIMUM_AGE = 130

      attr_accessor :query

      def initialize(query)
        @query = query
      end


      def parse_query
        {
            age: parse_age(@query)
        }
      end

      private

      def parse_age(string)
        age = string.scan(/([^\d]|^)([0-9]{1,3})([^\d]|$)/) # Greedy match numbers with 2 digits inside a string
                  .flatten
                  .select{|val| val != '' && val != ' ' }
                  .select{|val| val.to_i < MAXIMUM_AGE}
                  .first
      end

    end
  end
end