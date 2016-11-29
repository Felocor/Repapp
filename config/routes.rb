Rails.application.routes.draw do
  get 'republicas/index'

  get 'republicas/show'

  get 'republicas/new'

  get 'republicas/create'

  get 'republicas/edit'

  get 'republicas/update'

  get 'republicas/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :republica do
    resources :bookings
  end
end
