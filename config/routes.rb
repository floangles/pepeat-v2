Rails.application.routes.draw do



  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "home#index"
  resources :meals, only: [:index, :show]

  resource :profile, only: [:show, :edit, :update] do
    collection do
      get 'rating'
    end
  end
  resources :publics, only: [:index, :show]


  namespace :profile do
    resources :chief_pictures, only: [:destroy, :new, :create]
    resources :meal_pictures, only: [:destroy, :new, :create]
    resources :meals do
      collection do
        get 'history'
      end
    end
    resources :orders do
      resources :payments, only: [:new, :create]
      collection do
        get 'history'
        get 'rating'
        get 'charged'
      end
    end
  end
end
