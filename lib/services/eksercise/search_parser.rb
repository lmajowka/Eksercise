module Services
  module Eksercise
    class SearchParser

      MAXIMUM_AGE = 130
      PHONE_PREFIX_SIZE = 4

      attr_accessor :query

      def initialize(query)
        @query = query
      end

      def parse_query
        {
           age: parse_age,
           phone: parse_phone,
           name: parse_name
        }.compact
      end

      private

      def parse_age
        @query.scan(/([^\d]|^)([0-9]{1,3})([^\d]|$)/) # Greedy match numbers with maximum 3 digits inside a string
                  .flatten
                  .select{|val| val != '' && val != ' ' }
                  .select{|val| val.to_i <= MAXIMUM_AGE}
                  .try(:first)
      end

      def parse_phone
        phone = @query.scan(/[0-9-]{3,}/)
                .select{|val| val.to_i > MAXIMUM_AGE}
                .try(:first)

        if phone.present? && phone.size >= PHONE_PREFIX_SIZE && !phone.match(/-/)
          return phone.insert(PHONE_PREFIX_SIZE,'-')
        end

        phone
      end

      def parse_name
        @query.scan(/[\p{L}\. ]+/) #  \p{L} matches a single character belonging to the "letter" Unicode category
            .try(:first)
            .try(:strip)
      end

    end
  end
end