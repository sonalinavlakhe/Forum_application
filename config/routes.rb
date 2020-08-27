Rails.application.routes.draw do
  devise_for :users

  get "/dashboard" => "users#index"
  get "/sign_up" => "public#homepage"

  get "search" => "topics#search"
 
  resources :topics, only: [:new, :create, :show]
  resources :comments, only: [:create]

  root to:"users#index"
end
