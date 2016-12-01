Rails.application.routes.draw do
  # Root path
  root to: "pages#home"

  # User profile
  get '/user/:id', to: 'pages#user', as: 'user'

  # User's bookings path
  get '/user/:id/list_users', to: 'bookings#list_users', as: 'user_booking_list'

  # Booking validation
  get '/republica/:id/booking/:id/confirm_booking', to: 'bookings#confirm_booking', as: 'confirm_booking'
  get '/republica/:id/booking/:id/reject_booking', to: 'bookings#reject_booking', as: 'reject_booking'

  # FaceBook connect callback
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Resources path
  resources :republicas do
    resources :bookings
  end

  mount Attachinary::Engine => "/attachinary"
end
