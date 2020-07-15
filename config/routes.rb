Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  resources :plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
