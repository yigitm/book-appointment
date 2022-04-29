Rails.application.routes.draw do
  resources :details
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :create]
  post "/login", to: "users#login"
end
