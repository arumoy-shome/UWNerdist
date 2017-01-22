Rails.application.routes.draw do
  resources :queries, only: [:new]
  get'queries/results', to: 'queries#result', as: 'queries_results'
end
