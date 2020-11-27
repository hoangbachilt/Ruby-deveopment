Rails.application.routes.draw do
  post "signup", to: "users#create"
  post "/signin", to: "sessions#create"
  resources :transactions
  resources :images, only: %i(new create)
  resources :folders, only: %i(index show)
end
