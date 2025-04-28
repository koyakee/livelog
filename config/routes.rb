Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'home#index'
  resources :users, only: [:show, :edit, :update]
  resources :concerts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
