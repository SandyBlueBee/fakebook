Rails.application.routes.draw do
  get 'notifications/index'
  post '/mark_notifications_as_read', to: 'pages#mark_as_read', as: :mark_notifications_as_read

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'profile', to: 'pages#profile'
  put '/post/:id/like', to: 'posts#like', as: 'post_like'
  delete '/post/:id/unlike', to: 'posts#unlike', as: 'post_unlike'
  put '/comment/:id/like', to: 'comments#like', as: 'comment_like'
  delete '/comment/:id/unlike', to: 'comments#unlike', as: 'comment_unlike'
  delete '/posts/:id', to: 'posts#destroy', as: 'posts_destroy'

  resources :posts, only: [:index, :create, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end

  resources :chatrooms, only: [:index, :create] do
    resources :messages, only: [:create]
  end
  resources :pages
end
