Rails.application.routes.draw do
  get 'users/new'
    resources :todos
    root 'todos#home'
    get  '/signup',  to: 'users#new'
end
