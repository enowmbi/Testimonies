Rails.application.routes.draw do
  resources :assignments
  resources :tags
  resources :testimonies
  root 'home#index'
  devise_for :users
  resources :users, only: [:show]
  get 'home/index'
end
