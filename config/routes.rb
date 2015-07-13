Rails.application.routes.draw do

  devise_for :users
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'links#index'

end
