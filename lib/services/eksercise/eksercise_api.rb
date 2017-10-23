module Services
  module Eksercise
    class EkserciseApi

      API_URL = 'http://eksercise-api.herokuapp.com%s'
      AUTHENTICATION_HEADERS = { 'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef' }

      def self.search(query)

      parsed_query = SearchHelper.new(query).parse_query

      response = HTTParty.post API_URL % '/people/search',
                               {
                                   headers: AUTHENTICATION_HEADERS,
                                   body: parsed_query
                               }

      parsed_response = JSON.parse response.body
      search_id = parsed_response['id']

      sleep(25)

      response2 = HTTParty.get API_URL % "/people?searchRequestId=#{search_id}",
                               {
                                headers: AUTHENTICATION_HEADERS
                               }


      parsed_response2 = JSON.parse response2.body
      parsed_response2
    end

    end
  end
end