Rails.application.routes.draw do
  resources :queries, only: [:new, :create]
end
