Rails.application.routes.draw do

  resources :lines
  devise_for :users
  root to: "home#index"

end
