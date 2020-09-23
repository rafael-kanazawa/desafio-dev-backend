Rails.application.routes.draw do
  #POST to /auth_user => authentication method in AuthenticationController
  post 'auth_user' => 'authentication#authenticate_user'

  resources :user, only: [:index]

  resources :tables
  resources :bills do
    resources :orders
  end
  resources :menu_items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  

end
