ActionController::Routing::Routes.draw do |map|

  map.resources :barcamps do |barcamp|
    barcamp.resources :rooms
    barcamp.resources :periods
    barcamp.resources :talks
    barcamp.resources :acceptances    
  end
  
  map.root :controller => "home"
  
  map.connect 'auth/:provider/callback', :controller => 'omniauth', :action => 'callback'

  map.devise_for :users
end
