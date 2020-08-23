Rails.application.routes.draw do
  devise_for :users

  resources :videos, only: [:index, :new, :create]

  root to: 'videos#index'
  get '*path' => 'pages#page_404'
end
