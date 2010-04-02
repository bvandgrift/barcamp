ActionController::Routing::Routes.draw do |map|
  map.resources :rooms

  map.resources :barcamps do |barcamp|
    barcamp.resources :talks
    barcamp.resources :acceptances    
  end

  map.root :controller => :talks, :action => :index

  map.devise_for :users
end
