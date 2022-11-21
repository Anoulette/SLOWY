Rails.application.routes.draw do
  root to: "vehicles#index"
  devise_for :users
  get 'users/dashboard', to: "users#dashboard"

  resources :vehicles do
    resources :bookings, except: :destroy
  end
  resources :bookings, only: %i[index edit update destroy]
end
