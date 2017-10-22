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
            age: parse_age,
            phone: parse_phone,
            name: parse_name
        }
      end

      private

      def parse_age
        @query.scan(/([^\d]|^)([0-9]{1,3})([^\d]|$)/) # Greedy match numbers with maximum 3 digits inside a string
                  .flatten
                  .select{|val| val != '' && val != ' ' }
                  .select{|val| val.to_i <= MAXIMUM_AGE}
                  .first
      end

      def parse_phone
        @query.scan(/[0-9]{3,}/)
            .select{|val| val.to_i > MAXIMUM_AGE}
            .first
      end

      def parse_name
        @query.scan(/[\p{L}\. ]+/) #  \p{L} matches a single character belonging to the "letter" Unicode category
            .first
            .strip
      end

    end
  end
end