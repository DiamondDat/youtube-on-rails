Rails.application.routes.draw do
  devise_for :users
  post 'access' => 'users#access', as: :create_session

  resources :videos, only: [:index, :new, :create]

  root to: 'videos#index'
  get '*path' => 'pages#page_404'
end
