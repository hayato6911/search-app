Rails.application.routes.draw do
  get 'locations/index'
  get 'locations/posts'
  get 'helpful/index'
  resources :locations
  devise_for :users
  root to: "home#index"
  
  resources :users, :only => [:posts]
  resources :locations, :only => [:new]
end
