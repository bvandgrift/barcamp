Barcamp::Application.routes.draw do
  
  resources :barcamps do
    resources :rooms, :periods, :talks, :acceptances
  end

  root :to => "home#index"

  devise_for :users

end
