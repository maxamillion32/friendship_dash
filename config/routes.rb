Rails.application.routes.draw do
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Route to capture API post requests and set pre-flight headers
  match "api/participants" => "application#options", via: :options

  resources :participants, only: [:index, :show, :update]
  
  get "activate/:id" => "participants#activate", as: :activate
  
  # For client-side User and Participant syncing
  namespace "api", constraints: { format: 'json' }  do
    get "users" => "users#index"
    resources :participants, only: [:create, :index]
  end
  
  get 'home' => 'home#index'

  root 'home#index'
end
