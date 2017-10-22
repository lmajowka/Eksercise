Rails.application.routes.draw do

  root 'index#index'

  match '/search', to: 'search#search', via: :get

end
