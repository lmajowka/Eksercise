module Services
  module EkserciseApi
    class EkserciseApi

    def self.search(query)
      response = HTTParty.post 'http://eksercise-api.herokuapp.com/people/search',
                               {
                                   headers: authentication_headers,
                                   body: {
                                       phone: '33'
                                   }
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

    def self.parse_query(query)
      {
          age: parse_age(query)
      }
    end

    private

    def self.parse_age(string)
      age = string.scan(/([^\d]|^)([0-9]{1,2})([^\d]|$)/) # Greedy match numbers with 2 digits inside a string
                .flatten
                .select{|val| val != '' && val != ' ' }
    end

    def self.authentication_headers
      {
          'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef'
      }
    end

    end
  end
end