Rails.application.routes.draw do

  devise_for :users

  resources :meals, only: [:index]
  resource :profile, only: [:show, :edit, :update]

  namespace :profile do
    resources :meals
    resources :orders, exept: [:show]
    resources :histories, only: [:index]
    resources :ratings

  end
end
