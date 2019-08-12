Rails.application.routes.draw do
  get 'users/new'
    resources :todos
    root 'todos#index'
end
