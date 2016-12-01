Rails.application.routes.draw do
  root to: "pages#home"
  get '/user/:id/list_users', to: 'bookings#list_users', as: 'user_booking_list'
  get '/republica/:id/booking/:id/confirm_booking', to: 'bookings#confirm_booking', as: 'confirm_booking'
  get '/republica/:id/booking/:id/reject_booking', to: 'bookings#reject_booking', as: 'reject_booking'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :republicas do
    resources :bookings
  end

  mount Attachinary::Engine => "/attachinary"
end
