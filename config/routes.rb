VoyagerWebStore::Application.routes.draw do
  get "navigation_controller/index"

  resources :customers

  #set the root to the navigation homepage
  root :to => 'navigation#index'
  
  match '/about' => 'navigation#about', :as => :about, :via => :get
  
  match '/contact' => 'navigation#contact', :as => :contact, :via => :get

  match '/search_results' => 'navigation#search_results', :as => :search_results, :via => :post
  
  match '/search_results' => 'navigation#search_results', :as => :search_results, :via => :get
  
  match '/category/:id' => 'navigation#category', :as => :category, :via => :get
  
  match '/show/:id' => 'navigation#show', :as => :show, :via => :get

  match '/add_to_cart/:id' => 'navigation#add_to_cart', :as => :add_to_cart, :via => :post
  
  match '/remove_from_cart/:id' => 'navigation#remove_from_cart', :as => :remove_from_cart, :via => :post
  
  match '/checkout/:id' => 'navigation#checkout', :as => :checkout, :via => :post
  
  match '/customer/new' => 'customers#new', :as => :new_customer, :via => :get
  
  match 'customers' => 'customers#create', :as => :create_customer, :via => :post

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
