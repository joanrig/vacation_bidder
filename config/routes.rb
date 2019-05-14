Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :vacations

  resources :attractions
  resources :categories
  resources :users
    resources :bucket_list_items
  resources :vacations, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get root to: 'travelers#new'

  get '/signup', to: 'travelers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
