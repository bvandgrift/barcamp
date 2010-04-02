ActionController::Routing::Routes.draw do |map|
  map.resources :rooms

  map.resources :barcamps

  map.root :controller => :talks, :action => :index
  map.resources :talks

  map.devise_for :users
end
