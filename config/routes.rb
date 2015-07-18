Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'products#index'

  resources :products, only:[:index, :show]

  resource :cart, only: [:show, :destroy] do
    post :add, path:'/add/:id'
    get :checkout
  end

  namespace :admin do
    resources :products
  end
end
