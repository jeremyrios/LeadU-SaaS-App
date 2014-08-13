CS169Group31::Application.routes.draw do
  resources :password_resets

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  #get "survey/new"
  get "static_pages/index"

  root to: "static_pages#index"
  #  resources
  resources :users
  resources :sessions, only: [:new,:create,:destroy]
  resources :surveys, only: [:new,:create, :destroy]

  # routes for login
  match "login" => "sessions#new", :as => "login"
  match "logout" => "sessions#destroy", :as => "logout", :via => :get
  match "survey" => "survey#new", :as => "survey", :via => :get
  match "survey" => "survey#create", :as => "survey", :via => :post

  match "signup" => "users#new", :as => "signup"
  match "home" => "users#show", :as => "home"
  match "add_code" => "users#code", :as => "code"
  match "follow_code" => "users#follow_code", :as => "follow_code", :via => 'get'
  match "follow_code" => 'users#followsubmit', :as => "follow_code", :via => 'post' #follow button route
  
  match "edit_profile/:id" => "users#edit_profile", :as => "edit_profile", :via => 'get'
  match "update_profile/:id" => "users#update_profile", :as => "update_profile", :via => 'put'

  match "mbinfo" => 'static_pages#mbinfo'
  match "wifm" => 'static_pages#wifm'
  match "about" => 'static_pages#about'
  match "istj" => 'static_pages#istj'
  match "isfj" => 'static_pages#isfj'
  match "infj" => 'static_pages#infj'
  match "intj" => 'static_pages#intj'
  match "istp" => 'static_pages#istp'
  match "isfp" => 'static_pages#isfp'
  match "infp" => 'static_pages#infp'
  match "intp" => 'static_pages#intp'
  match "estp" => 'static_pages#estp'
  match "esfp" => 'static_pages#esfp'
  match "enfp" => 'static_pages#enfp'
  match "entp" => 'static_pages#entp'
  match "estj" => 'static_pages#estj'
  match "esfj" => 'static_pages#esfj'
  match "enfj" => 'static_pages#enfj'
  match "entj" => 'static_pages#entj'

  #routes for third party login
  match 'auth/:provider/callback', to: 'users#create_with_third_party_auth'

  #devise_scope :admin_user do
   # delete '/admin/logout' => 'active_admin/devise/sessions#destroy'
  #end

  #match '/signup',  to: 'users#new'

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
