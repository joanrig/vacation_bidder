Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :vacations do
    resources :vacation_attractions, only: [:new, :create]
  end

  resources :categories, only: [:index, :show]
  resources :attractions
  resources :bucket_list_items

  get '/attractions/index', to: 'categories#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





end
