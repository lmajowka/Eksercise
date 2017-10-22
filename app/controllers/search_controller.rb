class SearchController < ApplicationController

  def search
    render json: Services::EkserciseApi.search.to_json
  end

end
