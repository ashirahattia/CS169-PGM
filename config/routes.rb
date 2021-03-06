Rails.application.routes.draw do
  get 'matches/index'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
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
  root 'matches#index'
  resources :matches
  resources :groups
  resources :projects
  
  post 'groups/destroy_multiple' => 'groups#destroy_multiple'

  get 'google/fetch' => 'google#index'

  post 'google/authorize' => 'google#complete_authorization'

  get 'google/fetch/data' => 'google#projects_groups_fetch'

  post 'google/write/matches' => 'google#write_matches'
  get 'google/fetch/matches' => 'google#fetch_matches'

  get 'google/settings' => 'google#settings'
  put 'google/settings' => 'google#save_preferences'

  get 'login' => 'login#index'
  post 'login/attempt' => 'login#attempt'
  post 'login/logout' => 'login#logout'

  get '*path' => 'application#errors'

end
