Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users, except: [:new]
  resources :sessions, only: [:create]
  post '/logout', to: 'sessions#destroy'
  resources :rooms, only: [:show, :new, :create, :update]
  resources :posts, only: [:new, :create, :destroy]
  resources :topics, only: [:index]
  get '/statistics', to: 'statistics#index'
end
