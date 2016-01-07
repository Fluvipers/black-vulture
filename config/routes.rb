Rails.application.routes.draw do

  resources :lines
  devise_for :users
  root to: "home#index"

  get 'reports/:fact/', to: 'reports#total_retweets', as: 'reports', constraints: {fact: /\w+/}
  get 'facts/:line', to: 'facts#index', as: 'facts'
  get 'fact/', to: 'facts#show'
  post 'facts/', to: 'facts#create'

  # Temporal route for  report test
  resources :reports
end
