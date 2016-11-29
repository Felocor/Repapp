Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :republicas do
    resources :bookings
  end
end
