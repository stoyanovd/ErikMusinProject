Rails.application.routes.draw do


  resources :art_illustration_inners do
    member do
      get :move_up
      get :move_down
    end
    collection do
      get :add_defaults
      get :clean
    end
  end
  
  resources :art_illustrations do
    member do
      get :move_up
      get :move_down
    end
    collection do
      get :add_defaults
      get :clean
    end
  end
  
  resources :art_logos do
    member do
      get :move_up
      get :move_down
    end
    collection do
      get :add_defaults
      get :clean
    end
  end
  
  resources :art_letterings do
    member do
      get :move_up
      get :move_down
    end
    collection do
      get :add_defaults
      get :clean
    end
  end

  root "landing#index"

  get 'contacts' => "landing#contacts"
  get 'about' => "landing#about"

  controller :illustrations do
    get 'illustrations' => :index
    get 'illustrations/extra/:package' => :extra
  end

  controller :letterings do
    get 'letterings' => :index
  end
  controller :logos do
    get 'logos' => :index
  end

  match '*path', via: :all, to: 'application#not_found'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #You can have the root of your site routed with "root"

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
