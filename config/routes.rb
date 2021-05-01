Rails.application.routes.draw do

  resources :users
  root 'pictures#index'
  resources :pictures
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/signup' => 'users#new'
  post '/users/new' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' =>  'sessions#destroy'
  
  
  
  
end
