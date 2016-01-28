Rails.application.routes.draw do

  resources :lines
  devise_for :users
  root to: "home#index"

  get 'reports/:fact/', to: 'reports#create_report', as: 'reports', constraints: {fact: /\w+/}
  get 'facts/:line', to: 'facts#index', as: 'facts'
  get 'fact/', to: 'facts#show'
  post 'facts/', to: 'facts#create'
  post 'facts/update/', to: 'facts#update', as: 'update_facts'
  get 'dashboard/:id/', to: 'dashboards#show', as: 'dashboard'

  # Temporal route for  report test
  resources :reports
end
