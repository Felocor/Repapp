Rails.application.routes.draw do
  # Root path
  root to: "pages#home"

  # User profile
  get '/user/:id', to: 'pages#user', as: 'user'

  # User's bookings path
  get '/user/:id/list_users', to: 'bookings#list_users', as: 'user_booking_list'




  # List of a user's republicas
  get '/republicas/user_republicas', to: 'republicas#user_republicas', as: 'user_republicas'

  # FaceBook connect callback
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Resources path
  resources :republicas do
    resources :bookings do
      member do
        get '/cancel', to: 'bookings#cancel_booking', as: 'cancel'
        get '/confirm', to: 'bookings#confirm_booking', as: 'confirm'
        get '/reject', to: 'bookings#reject_booking', as: 'reject'
      end
    end
  end

  mount Attachinary::Engine => "/attachinary"
end
