Rails.application.routes.draw do

  resources :lines
  devise_for :users
  root to: "home#index"

  get 'reports/:fact/', to: 'reports#total_retweets', as: 'reports', constraints: {fact: /\w+/}

  # Temporal route for  report test
  resources :reports
end
