Rails.application.routes.draw do
  post "signup", to: "users#create"
  post "/signin", to: "sessions#create"
  resources :transactions
  resources :folders, only: %i(index show create)
  resources :users, only: :show
  resources :invitations, only: %i(index update destroy)
  resources :images, only: %i(new create update destroy)
  resources :folders, only: %i(index show)
end
