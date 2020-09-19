Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  get '/mypage', to: 'welcome#mypage'

  get '/users', to: 'users#users'

  get '/user/:id', to: 'users#show'

  get '/follow/:user_id', to: 'users#follow'

  post '/comment', to: 'comments#create'

  post '/like/:post_id', to: 'posts#like'

  delete '/dislike/:post_id', to: 'posts#dislike'

  delete '/unfollow/:user_id', to: 'users#unfollow'

  delete '/delcomment/:id', to: 'comments#destroy'

  get '/feed', to: 'welcome#feed'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
