Rails.application.routes.draw do
  root 'listings#index'
  get '/register' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :listings do
    get :refresh_listings, on: :collection
  end

  namespace :provider do
    resources :listings
  end
  
end
