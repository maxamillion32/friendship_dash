Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :participants, only: [:index, :show]
  
  get 'home' => 'home#index'
  root 'home#index'

  namespace "api", constraints: { format: 'json' }  do
    get "users" => "users#index"
    # post "participants" => "participants#update"
    resources :participants, only: [:create, :index]
  end
end
