Rails.application.routes.draw do
  resources :groups
  devise_for :users
  resources :replies
  resources :questions
  resources :comments
  resources :submissions
  resources :rankings
  resources :users
  resources :translations
  resources :originals
  resources :assignments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'assignments#index'
  get '/gradebook', to: 'submissions#gradebook', as: 'gradebook'
  post '/groups/:id/edit', to: 'groups#update_groups', as: 'update_groups'
end