Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "games#index"
  resources :games
  devise_scope :user do 
    get 'users/:id', to: 'users#show', as: 'user_profile'
  end

  resources :chat_rooms, only: [:show, :index]
  post :private_message, to: 'chat_rooms#private_message'
  resources :chat_messages, only: [:create]
  resources :games do
    resources :join_requests do
      member do
        post :create
        patch :accept
        patch :reject
      end
    end
    # post 'accept_join_request/:id', to: 'join_requests#accept', as: 'accept_join_request'
    # post 'reject_join_request/:id', to: 'join_requests#reject', as: 'reject_join_request'
  end
end
