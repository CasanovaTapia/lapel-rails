Rails.application.routes.draw do

  resources :items


  get 'static/index'

  devise_for :users

  resources :users, only: [:show] do
    resources :orders do
      resources :order_items, only: [:create, :update, :destroy]
    end
    resources :accounts, only: [:create]
    resources :appointments
  end

  root :to => 'static#index'
  get 'dashboard', to: 'profile#view', as: :profile_view
end
