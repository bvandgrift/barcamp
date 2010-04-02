ActionController::Routing::Routes.draw do |map|
  map.root :controller => :talks, :action => :index
  map.resources :talks

  map.devise_for :users
end
