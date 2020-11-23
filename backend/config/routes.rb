Rails.application.routes.draw do
  resources :images, only: %i(new create)
  resources :folders, only: %i(index)
end
