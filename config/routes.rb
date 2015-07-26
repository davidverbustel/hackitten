Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :links, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
     put "like", to: "links#upvote"
     put "dislike", to: "links#downvote"
   end
 end

  root 'links#index'

end
