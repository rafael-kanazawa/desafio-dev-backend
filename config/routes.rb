Rails.application.routes.draw do
  
  post '/log_in', to: 'authentication#authenticate_user'

  post '/sign_in', to: 'users#create'
  resources :users, only: [:index, :destroy, :update]

  
  put '/close_bill', to: 'bills#close_bill'
  resources :bills do
    resources :orders
  end

  resources :tables
  resources :menu_items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  resources :sales, only: [:index, :destroy, :show]

end
