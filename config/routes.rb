Rails.application.routes.draw do
  root 'profiles#index'
  devise_for :users
  resources :profiles, only: %i(index show)
  resources :divisions, only: %i(index new create edit update destroy)
  resources :educations, only: %i(new create edit update show destroy) do
    member do
      get 'list'
    end
  end
  resources :subjects, only: %i(new create edit update show destroy)
  resources :teachings, only: %i(new create edit update show destroy)
  resources :relationships, only: %i(create)
end
