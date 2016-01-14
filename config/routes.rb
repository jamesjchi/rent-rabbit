Rails.application.routes.draw do


  get 'signup'                  => 'users#new'

  # Sessions routes
  get 'login'                   => 'sessions#new'
  post 'login'                  => 'sessions#create'
  get 'logout'                  => 'sessions#destroy'

  get 'auth/logout'             => 'auth#logout'
  get 'auth/failure'            => 'auth#failure'
  get 'auth/:provider/callback' => 'auth#callback'

  resources :users do
    resources :reviews
  end

  resources :items
  root 'main#index'

  get 'main/about'

end
