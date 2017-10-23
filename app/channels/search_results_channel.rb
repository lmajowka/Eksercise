class SearchResultsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search_results#{params[:uuid]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
