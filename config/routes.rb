Rails.application.routes.draw do
  
  post 'users' => "users#create" 
  get "users" => "users#index"
  get "users/:id" => "users#show"

  # get "user_accounts/:user_id" => "user_accounts#show"
  patch "user_accounts" => "user_accounts#update"
  delete "user_accounts" => "user_accounts#destroy"

  get "sessions" => "sessions#index"
  post "sessions" => "sessions#create"
  patch "sessions" => "sessions#update"
  delete "sessions" => "sessions#destroy"

  get "areas" => "areas#index"
  get "areas/:id" => "areas#show"
  post "areas" => "areas#create"

  post "accounts" => "accounts#create"

  get "plans" => "plans#index"
  post "plans" => "plans#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
