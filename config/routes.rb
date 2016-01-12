Rails.application.routes.draw do
  # get 'reviews/new'

  # get 'reviews/create'

  # get 'reviews/show'

  # get 'items/new'

  # get 'items/create'

  # get 'items/update'

  # get 'items/edit'

  # get 'items/show'

  # get 'items/destroy'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'main/index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/update'

  # get 'users/edit'

  # get 'users/show'

  # get 'users/destroy'

  # User routes
  get 'signup'        => 'users#new'

  # Sessions routes
  get 'login'         => 'sessions#new'
  post 'login'        => 'sessions#create'
  get 'logout'        => 'sessions#destroy'

  resources :users do
    resources :reviews
  end

  resources :items
  root 'main#index'

  post '/users' => 'users#update'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
