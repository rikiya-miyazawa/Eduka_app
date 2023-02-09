Rails.application.routes.draw do
  resources :educations
  resources :subjects, only: %i(new create edit update show destroy)
end
