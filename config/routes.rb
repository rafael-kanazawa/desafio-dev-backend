Rails.application.routes.draw do
  #POST to /log_in => authentication method in AuthenticationController
  post '/log_in', to: 'authentication#authenticate_user'

  post '/sign_in', to: 'users#create'
  resources :users, only: [:index, :destroy, :update]

  resources :tables
  resources :bills do
    resources :orders
  end
  resources :menu_items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  

end
