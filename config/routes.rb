Rails.application.routes.draw do
  root 'listings#index'
  get '/register' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :listings do
    get :refresh_listings, on: :collection
    post :cancel, on: :member
  end
  namespace :provider do
    resources :listings do
      post :cancel, on: :member
    end
  end
end
