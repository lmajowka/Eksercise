module Services
  module Eksercise
    class EkserciseApi

      API_URL = 'http://eksercise-api.herokuapp.com%s'
      AUTHENTICATION_HEADERS = { 'X-KLARNA-TOKEN' => 'bc6132fb-16b9-4f6a-ab3c-c5c9017dbcef' }
      IN_PROGRESS_STATUS = 102
      SUCCESS_STATUS = 200

      def self.search(query, page, uuid)

        search_id = get_search_id(query, page)
        Resque.enqueue(PollForSearchResponse, search_id, uuid)

      end

      def self.get_search_id(query, page)

        search_id = nil
        parsed_query = SearchParser.new(query).parse_query.merge({ page: page })

        EM.run do

          url = API_URL % '/people/search'

          http = EventMachine::HttpRequest.new(url, connect_timeout: 10, inactivity_timeout: 20).post({
             head: AUTHENTICATION_HEADERS,
             body: parsed_query
          })

          http.callback {
            parsed_response = JSON.parse http.response
            search_id = parsed_response['id']
            EM.stop
          }

        end

        search_id

      end

      def self.poll_for_search_response(search_id, uuid)

        search_response = nil
        current_status = IN_PROGRESS_STATUS

        while current_status == IN_PROGRESS_STATUS do

          EM.run do

            url =  API_URL % "/people?searchRequestId=#{search_id}"

            http = EventMachine::HttpRequest.new(url, connect_timeout: 10, inactivity_timeout: 20).get({
              head: AUTHENTICATION_HEADERS,
            })

            http.callback {
              current_status = http.response_header.status
              if current_status == SUCCESS_STATUS
                search_response = JSON.parse http.response
                ActionCable.server.broadcast "search_results#{uuid}", search_response
              end
              EM.stop
            }

          end

          sleep(1)

        end

        search_response

      end

    end
  end
end