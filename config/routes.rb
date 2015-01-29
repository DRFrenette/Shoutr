Rails.application.routes.draw do
  root "shouts#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :show] do
    resource :following_relationship, only: [:create, :destroy]
  end
  resources :shouts, only: [:index, :create]
end
