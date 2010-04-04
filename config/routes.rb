ActionController::Routing::Routes.draw do |map|

  map.resources :barcamps do |barcamp|
    barcamp.resources :rooms
    barcamp.resources :periods
    barcamp.resources :talks
    barcamp.resources :acceptances    
  end

  map.root :controller => :talks, :action => :index

  map.devise_for :users
end
