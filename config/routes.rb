Rails.application.routes.draw do
  root to: "links#index"

  get '/signup', to: 'users#new'
  resources :users, only: [:new, :create]
  resources :links, only: [:create, :index, :edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
