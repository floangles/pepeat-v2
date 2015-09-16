Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users

  resources :meals, only: [:index, :show]
  resource :profile, only: [:show, :edit, :update]


  namespace :profile do
    resources :meals
    resources :orders
    resources :histories
    resources :ratings, only: [:index]
  end
end
