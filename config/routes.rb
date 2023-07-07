Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'profile', to: 'pages#profile'
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create, :destroy]
  end
end
