Rails.application.routes.draw do
  namespace :admin do
    resources :users
    get '/tasks', to: 'tasks#index'
  end


  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  resources :tasks
  root 'tasks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
