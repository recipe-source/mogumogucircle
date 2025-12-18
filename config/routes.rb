Rails.application.routes.draw do
  devise_for :users
  
  root 'recipes#index'

  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end

  resources :perfumes
  resources :users, only: [:show]
end