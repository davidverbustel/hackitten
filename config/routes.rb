Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'links#index'

end
