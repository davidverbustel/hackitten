Rails.application.routes.draw do

  resources :links, only: [:index, :new, :create, :destroy]

  root 'links#index'


end
