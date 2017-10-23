module Services
  module Eksercise
    class EkserciseApi

    def self.search(query)

      parsed_query = SearchHelper.new(query).parse_query

      response = HTTParty.post 'http://eksercise-api.herokuapp.com/people/search',
                               {
                                   headers: authentication_headers,
                                   body: parsed_query
                               }

      parsed_response = JSON.parse response.body
      search_id = parsed_response['id']

      sleep(25)
      
      response2 = HTTParty.get "http://eksercise-api.herokuapp.com/people?searchRequestId=#{search_id}",
                               {
                                headers: authentication_headers
                               }


      parsed_response2 = JSON.parse response2.body
      parsed_response2
    end

    private

    def self.authentication_headers
      {
          'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef'
      }
    end

    end
  end
end