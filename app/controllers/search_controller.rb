class SearchController < ApplicationController

  def search
    render json: Services::Eksercise::EkserciseApi.search(params[:query]).to_json
  end

end
