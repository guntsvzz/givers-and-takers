Rails.application.routes.draw do
  # Define account routes
  get 'account/giver', to: 'account#giver', as: 'account_giver'
  get 'account/taker', to: 'account#taker', as: 'account_taker'
  get 'account/settings', to: 'account#settings', as: 'account_settings'
  get 'account/profile', to: 'account#profile', as: 'account_profile'
  get 'profile/:id', to: 'users#show', as: :profile
  get "home/index"
  # get 'navbar', to: 'navbar#show' # example route if there's a 'show' action in the NavbarController

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # resources :interests, only: [:new, :create]
  # resources :interests
  resources :requests do
    resources :donations, only: [:new, :create, :show]
  end
  resources :verifications, only: [:index]  # Limit routes to index only
  # Custom route for updating taker status
  post 'update_status/:id', to: 'verifications#update_status', as: 'update_taker_status'
  resources :notifications do
    member do
      get :view_interest
    end
  end
  resources :users, only: [:show] do 
    get 'more_givers', on: :collection
  end

  resources :interests do
    member do
      patch :update_status
    end
  end  

  # get "donations/show"
  # get "donations/create"
  # resources :students 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'  # Replace 'home#index' with your desired controller and action
  get 'navbar', to: 'application#navbar'
  get 'about_us', to: 'pages#index', as: 'about_us'

  # Define the search route (customize the controller/action as needed)
  get 'search', to: 'search#index', as: 'search'
  # Define other routes for givers and takers if they aren't already defined
  get 'givers', to: 'users#givers', as: 'givers'
  get 'takers', to: 'users#takers', as: 'takers'
  
  # Use different route names to avoid conflicts
  get 'interests_list', to: 'interests#index', as: 'interests_list'
  get 'requests_list', to: 'requests#index', as: 'requests_list'
  
  # This route will respond to any OPTIONS requests and prevent routing errors
  match '*path', to: 'application#preflight', via: :options
end
