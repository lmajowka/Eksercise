class SearchController < ApplicationController

  def search
    render json: Services::Eksercise::EkserciseApi.search(params[:query], params[:page], params[:uuid]).to_json
  end

end
