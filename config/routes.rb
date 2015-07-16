Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'products#index'

  resources :products

  namespace :admin do
    resources :products
  end
end
