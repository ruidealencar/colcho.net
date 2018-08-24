Rails.application.routes.draw do
  resources :rooms
  resources :users

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destory]

  root 'home#index'
end
