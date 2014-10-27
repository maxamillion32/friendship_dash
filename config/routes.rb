Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'devise/registrations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Route to capture API post requests and set pre-flight headers
  match "api/participants", to: "application#options", via: :options

  resources :participants, only: [:index, :show, :update]

  get "activate/:id", to: "participants#activate", as: :activate
  get "active_index", to: "participants#active_index", as: :active_participants

  #Health Workers
  get "health_workers", to: "health_workers#index", as: :health_workers
  get "health_workers/new", to: "health_workers#new", as: :new_health_worker
  get "health_workers/edit/:id", to: "health_workers#edit", as: :edit_health_worker

  # RAs
  get "research_assistants", to: "research_assistants#index", as: :research_assistants
  get "research_assistants/new", to: "research_assistants#new", as: :new_research_assistant
  get "research_assistants/edit/:id", to: "research_assistants#edit", as: :edit_research_assistant

  # Supervisors
  get "supervisors", to: "supervisors#index", as: :supervisors
  get "supervisors/new", to: "supervisors#new", as: :new_supervisor
  get "supervisors/edit/:id", to: "supervisors#edit", as: :edit_supervisor

  resources :users, only: [:update]

  # For client-side User and Participant syncing
  namespace "api", constraints: { format: 'json' }  do
    get "users", to: "users#index"
    resources :participants, only: [:create, :index]
  end

  get 'home', to: 'home#index'

  root 'home#index'
end
