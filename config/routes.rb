Rails.application.routes.draw do
  
  devise_for :users
  resources :tables
  resources :bills do
    resources :orders
  end
  resources :menu_items, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
