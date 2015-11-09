Rails.application.routes.draw do



  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }

  root to: "home#index"
  resources :meals, only: [:index, :show]

  resource :profile, only: [:show, :edit, :update] do
    collection do
      get 'rating'
    end
    collection do
        get 'croping'
    end
  end
  resources :publics, only: [:index, :show]


  namespace :profile do
    resources :chief_pictures, only: [:destroy, :new, :create, :update]
    resources :meal_pictures, only: [:destroy, :new, :create, :update]
    resources :meals do
      collection do
        get 'mealpic'
        get 'mealcrop'
        get 'history'
        get 'validation'
      end
    end
    resources :orders do
      resources :payments, only: [:new, :create]
      collection do
        get 'history'
        get 'rating'
        get 'validation'
      end
    end
  end
end
