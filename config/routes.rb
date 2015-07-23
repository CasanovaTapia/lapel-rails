Rails.application.routes.draw do

  get 'contact_form/new'

  get 'contact_form/create'

  resources :items
  get 'landing/splash'

  devise_for :users

  resources :users, only: [:show] do
    resources :orders do
      resources :order_items, only: [:create, :update, :destroy]
    end
    resources :accounts, only: [:create]
    resources :appointments
  end

  root :to => 'landing#splash'
  get 'dashboard', to: 'landing#dash_app', as: :landing_dash_app
  get 'request', to: 'client#req', as: :client_req
  get 'wardrobe', to: 'client#wardrobe', as: :client_wardrobe
end
