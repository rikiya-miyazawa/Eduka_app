Rails.application.routes.draw do
  get 'teachings/new'
  get 'teachings/edit'
  get 'teachings/show'
  resources :educations
  resources :subjects, only: %i(new create edit update show destroy)
end
