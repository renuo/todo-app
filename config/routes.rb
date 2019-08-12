Rails.application.routes.draw do
  get 'users/new'
  resources :todos
  resources :users
  root 'todos#home'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
end
