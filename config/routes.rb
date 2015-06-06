DinnerDash::Application.routes.draw do
  
  get "carts/destroy"
  resources :users, only: [:new, :create, :edit, :update]

  resources :sessions, only: [:new, :create]
  
  resources :carts, only: [:destroy]

  resources :line_items

  resources :items 

  resources :admin_dash_board, only: [:index, :show] do
    member do
      put 'mark_as_completed'
      put 'mark_as_paid'
      put 'cancel'
    end
  end
  
  resources :orders
  
  resources :categories do
    member do
      patch 'remove_from_category'
    end
  end

  match '/register', to: "users#new", via: :get
  match 'login', to: "sessions#new", via: :get
  match 'logout', to: "sessions#destroy", via: :delete
  match 'reset_password', to: "sessions#set_new_password", via: :get
  match 'get_new_password', to: "sessions#forgot_password", via: :post
  match 'retire_item', to: "items#retire", via: :post
  match 'mark_order_as_completed', to: "admin_dash_board#mark_as_completed", via: :post
  match 'mark_order_as_paid', to: "admin_dash_board#mark_as_paid", via: :post
  match 'cancel_order', to: "admin_dash_board#cancel", via: :post

  #match 'retire', to: "items#retire", via: :post
  root to: "home#index"
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
