class PollForSearchResponse
  @queue = :default

  def self.perform(search_id, uuid)
    Services::Eksercise::EkserciseApi.poll_for_search_response search_id, uuid
  end
end