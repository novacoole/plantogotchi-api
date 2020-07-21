Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  post "/sign-up", to: "users#create"
  get "/myaccount", to: "users#show"
  put "/updateuser", to: "users#update"
  get "/status", to: "status#index"
  get "/status/user", to: "status#user"
  resources :plants, :breeds
  resources :users, :except => [:create, :show, :update]
end
