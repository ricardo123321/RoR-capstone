Rails.application.routes.draw do
  resources :groups
  resources :hours
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :friendships
  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/external', to: 'hours#external'
  get '/profile', to: 'users#profile'
  get '/alluser', to: 'users#alluser'
  get '/friends', to: 'users#friends'
  root to: 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
