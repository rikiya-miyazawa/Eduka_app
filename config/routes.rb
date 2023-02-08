Rails.application.routes.draw do
  get 'subjects/new'
  get 'subjects/edit'
  get 'subjects/show'
  resources :educations
end
