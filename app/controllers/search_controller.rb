class SearchController < ApplicationController

  def search
    render json: Services::Eksercise::EkserciseApi.search(params[:query], params[:page]).to_json
  end

end
