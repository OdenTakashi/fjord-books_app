Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :books

  root to: 'users#index'
end
