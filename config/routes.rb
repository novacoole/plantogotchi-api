Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  post "/sign-up", to: "users#create"
  resources :plants
  resources :users, :except => [:create]
end
