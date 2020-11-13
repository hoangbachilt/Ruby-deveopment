Rails.application.routes.draw do
  get "/signup", to: "users#new"
  post "signup", to: "users#create"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  resources :transactions
  resources :images, only: %i(new create)
  resources :folders, only: %i(index)
  resource :users , only: [:create]
end
