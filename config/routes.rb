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

  resources :vacations
  resources :bucket_list_items
  resources :bucket_attractions, only: [:new, :create]
  resources :categories, only: [:index, :show]

  resources :users do
    resources :attractions, shallow: true
  end

  get '/attractions/index', to: 'categories#index'

  get '/bucket_list_items/:bucket_list_item_id/attractions', to: "bucket_list_items#attractions"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





end
