Rails.application.routes.draw do
  root to: "pages#home"
  get '/user/:id/list_users', to: 'bookings#list_users', as: 'user_booking_list'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :republicas do
    resources :bookings
  end

  mount Attachinary::Engine => "/attachinary"
end
