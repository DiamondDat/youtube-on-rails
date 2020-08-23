Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :videos, only: [:index, :new, :create]
end
