Rails.application.routes.draw do
  get "home/index"
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :interests
  resources :requests #, only: [:show]
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
  get 'about_us', to: 'pages#index', as: 'about_us'
  get 'givers', to: 'users#givers', as: 'givers'
  get 'takers', to: 'users#takers', as: 'takers'
  get 'your_account', to: 'users#your_account', as: 'your_account'
  
  # Use different route names to avoid conflicts
  get 'interests_list', to: 'interests#index', as: 'interests_list'
  get 'requests_list', to: 'requests#index', as: 'requests_list'
end
