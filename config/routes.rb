Rails.application.routes.draw do
  #POST to /log_in => authentication method in AuthenticationController
  post '/log_in' to: 'authentication#authenticate_user'

  get '/user' to: 'user#index'
  post 'user/sign_in' to: 'user#create'
  delete '/user' to: 'user#delete'
  resources 

  resources :tables
  resources :bills do
    resources :orders
  end
  resources :menu_items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  

end
