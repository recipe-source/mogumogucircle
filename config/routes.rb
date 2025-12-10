Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  resources :users, only: [:show]
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  resources :recipes
  end
  resources :perfumes
end