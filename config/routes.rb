Rails.application.routes.draw do
  root to: "vehicles#index"
  devise_for :users
  get '/dashboard', to: "bookings#dashboard"
  get '/dashboard/booking/:id/edit', to: "bookings#edit", as: :edit_dashboard
  patch '/dashboard/booking/:id/approve', to: "bookings#approve", as: :approve
  # patch '/bookings', to: "bookings#update"

  resources :vehicles do
    resources :bookings, except: :destroy
  end
  resources :bookings, only: :destroy
end
