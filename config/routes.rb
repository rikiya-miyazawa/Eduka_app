Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i(index show)
  resources :educations, only: %i(new create edit update show destroy) do
    member do
      get 'list'
    end
  end
  resources :subjects, only: %i(new create edit update show destroy)
  resources :teachings, only: %i(new create edit update show destroy)
  root 'educations#index'
end
