require 'resque_web'

Rails.application.routes.draw do

  root 'index#index'
  match '/search', to: 'search#search', via: :get
  mount ResqueWeb::Engine => '/resque_web'

end
