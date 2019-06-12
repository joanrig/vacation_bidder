Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "callbacks" }

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  resources :bucket_list_items do
    resources :vacations, only: [:new, :create]
  end

  resources :vacations do
    resources :schedules
    resources :vacation_attractions, only: [:new, :create]
  end

  resources :categories, only: [:index, :show]

  post '/attractions/search', to: 'attractions#search', as: 'attractions_search'
  get '/attractions/index', to: 'categories#index'

  resources :attractions do
    resources :user_attractions, only: [:create, :show]
  end

  resources :attraction_categories, only: [:new, :create]

  resources :bidders do
    resources :bids
  end






end
