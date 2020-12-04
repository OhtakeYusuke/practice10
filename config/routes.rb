Rails.application.routes.draw do
  root to:  "posts#index"
  resources :posts
  resources :users do
    post "confirm", on: :new
  end
  namespace :admin do
    resources :users, only: [:index]
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
