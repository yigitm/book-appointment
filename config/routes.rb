# frozen_string_literal: true

Rails.application.routes.draw do
  #mount Rswag::Ui::Engine => '/api-docs'
  #mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[index create]
      resources :courses, only: %i[index create show destroy]
      resources :details, only: [:index]
      post '/login', to: 'users#login'
      post '/courses/new', to: 'courses#create'
      delete 'courses/delete', to: 'courses#destroy'
    end
  end
end
