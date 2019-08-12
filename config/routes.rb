Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  resources :todos
  resources :users
  root 'todos#home'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
