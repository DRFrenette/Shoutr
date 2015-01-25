Rails.application.routes.draw do
  root "shouts#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :following_relationships, only: [:create]
  end
  resources :shouts, only: [:index, :create]
end
