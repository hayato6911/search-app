Rails.application.routes.draw do
  get 'locations/index'
  get 'locations/posts'
  get 'helpful/index'
  resources :locations
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: "home#index"
  
  resources :users, :only => [:posts, :index, :show]
  
  resources :locations, :only => [:new] do
    resources :reviews, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
  end
end
