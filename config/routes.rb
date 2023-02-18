Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
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
  resources :tops, only: %i(index) do
    collection do
      get 'menu'
    end
  end
end
