Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Dashboard routes - keep just one clear definition
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  # If you still need the users/dashboard route specifically, keep it
  # But generally it's better to have just one route to the same action
  get 'users/dashboard', to: 'users#dashboard', as: 'user_dashboard'

  resources :users, only: [:show]

  resources :listings, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    member do
      patch :cancel
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
