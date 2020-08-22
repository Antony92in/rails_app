Rails.application.routes.draw do
 

  devise_for :users

  resources :posts

  get '/userpage', to: 'welcome#userpage'

  get '/users', to: 'users#users'

  get '/user/:id', to: 'users#show'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
