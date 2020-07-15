Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  resources :plants, :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
