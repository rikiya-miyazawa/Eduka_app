Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'profiles#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :educations, only: %i(new create edit update show destroy) do
    member do
      get 'list'
    end
  end
  resources :profiles, only: %i(index show) do
    collection do
      get 'search'
    end
  end
  resources :divisions, only: %i(index new create edit update destroy)
  resources :subjects, only: %i(new create edit update show destroy)
  resources :teachings, only: %i(new create edit update show destroy)
  resources :relationships, only: %i(create destroy)
end
