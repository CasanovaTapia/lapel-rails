Rails.application.routes.draw do
  resources :items
  get 'profile/view'
  get 'dashboard/index'

  devise_for :users

  resources :users, only: [:show] do
    resources :orders
  end

  root :to => 'dashboard#index'
end
