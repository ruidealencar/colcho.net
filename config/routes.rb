Rails.application.routes.draw do
  resources :rooms
  resources :users

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destory]

  resources :rooms do
    resources :reviews, only: [:create, :update]
  end

  delete "/user_sessions" => "user_sessions#destroy"

  root 'home#index'
end
