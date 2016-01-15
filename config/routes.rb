Rails.application.routes.draw do

  get 'signup'                  => 'users#new'

  # Sessions routes
  get 'login'                   => 'sessions#new'
  post 'login'                  => 'sessions#create'
  get 'logout'                  => 'sessions#destroy'
  post 'logout'                 => 'sessions#destroy'

  # OAuth routes
  get 'auth/logout'             => 'auth#logout'
  get 'auth/failure'            => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'

  # Password Reset routes
  get  'reset'                  => 'passwords#new'
  post 'reset'                  => 'passwords#create'
  get  'newpassword'            => 'passwords#create_new'
  post 'newpassword'            => 'passwords#update'

  # User Routes with Reviews Routes
  resources :users do
    resources :reviews
  end

  # Items Routes
  resources :items

  # Root path
  root 'main#index'

  # About Dev Team Path
  get 'main/about'

end
