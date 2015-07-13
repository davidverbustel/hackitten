Rails.application.routes.draw do

  resources :links, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'links#index'


end
