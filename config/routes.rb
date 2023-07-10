Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'profile', to: 'pages#profile'
  put '/post/:id/like', to: 'posts#like', as: 'post_like'
  delete '/post/:id/unlike', to: 'posts#unlike', as: 'post_unlike'
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create, :destroy]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: [:create]
  end
end
