module Services
  class EkserciseApi

    def self.search
      response = HTTParty.post 'http://eksercise-api.herokuapp.com/people/search',
                               {
                                   headers: {
                                   'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef'
                                   },
                                   body: {
                                       phone: '33'
                                   }
                               }

      parsed_response = JSON.parse response.body
      search_id = parsed_response['id']

      sleep(25)


      response2 = HTTParty.get "http://eksercise-api.herokuapp.com/people?searchRequestId=#{search_id}",
                               {
                                headers: {
                                    'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef'
                                }
                               }


      parsed_response2 = JSON.parse response2.body
      parsed_response2
    end

  end
end