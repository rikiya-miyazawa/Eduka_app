Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i(index show)
  resources :educations
  resources :subjects, only: %i(new create edit update show destroy)
  resources :teachings, only: %i(new create edit update show destroy)
  root 'educations#index'
end
