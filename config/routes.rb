Squeaker::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/login'  => 'sessions#new', as: 'login'
  match '/logout' => 'sessions#destroy'

  root to: 'home#index'
end
