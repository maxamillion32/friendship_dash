Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'devise/registrations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Route to capture API post requests and set pre-flight headers
  match "api/participants", to: "application#options", via: :options

  resources :participants, only: [:index, :show, :update]

  get "activate/:id", to: "participants#activate", as: :activate
  get "active_index", to: "participants#active_index", as: :active_participants

  #Health Workers
  resources :health_workers, only: [:index, :edit, :new]

  # RAs
  resources :research_assistants, only: [:index, :new, :edit]

  # Supervisors
  resources :supervisors, only: [:index, :new, :edit]

  resources :surveys do
    collection { post :import }
  end

  resources :users, only: [:update]

  # For client-side User and Participant syncing
  namespace "api", constraints: { format: 'json' }  do
    resources :users, only: [:index]
    resources :participants, only: [:create, :index]
    resources :surveys, only: [:index]
    resources :responses, only: [:create]
  end

  get 'home', to: 'home#index'

  root 'home#index'
end
