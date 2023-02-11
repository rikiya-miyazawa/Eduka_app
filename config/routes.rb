Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/show'
  devise_for :users
  resources :educations
  resources :subjects, only: %i(new create edit update show destroy)
  resources :teachings, only: %i(new create edit update show destroy)
  root 'educations#index'
end
