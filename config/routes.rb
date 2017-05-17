Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'rooms/index'
  root 'rooms#index'
end
