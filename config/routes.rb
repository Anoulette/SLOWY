Rails.application.routes.draw do
  devise_for :users
  root to: "vehicles#index"
  resources :vehicles do
    resources :bookings, except: :destroy
  end
  resources :bookings, only: %i[index edit update destroy]
end
