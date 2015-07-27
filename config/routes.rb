Rails.application.routes.draw do

  resources :contact_forms

  resources :items
  get 'landing/splash'

  devise_for :users

  resources :users, only: [:show] do
    resources :orders do
      resources :order_items, only: [:create, :update, :destroy]
    end
    resources :accounts, only: [:create, :new, :show]
    resources :appointments
  end

  root :to => 'landing#splash'
  get 'dashboard', to: 'landing#dash_app', as: :landing_dash_app
  get 'request', to: 'client#req', as: :client_req
  get 'wardrobe', to: 'client#wardrobe', as: :client_wardrobe
  get 'clients', to: 'internal#clientele', as: :internal_clientele
  get 'inventory', to: 'internal#inventory', as: :internal_inventory
end
