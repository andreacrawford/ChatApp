Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'rooms/index'
  root 'rooms#index'

  mount ActionCable.server => '/cable'
  
end
