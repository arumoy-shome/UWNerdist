Rails.application.routes.draw do
  resources :schedules, only: :index
end
