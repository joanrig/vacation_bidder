Rails.application.routes.draw do
  get 'bidder/new'
  get 'bidder/create'
  get 'bidder/show'
  get 'bidder/index'
  get 'bidder/edit'
  get 'bidder/update'
  get 'bidder/index'
  get 'bidder/new'
  get 'bidder/create'
  get 'bidder/show'
  get 'bidder/edit'
  get 'bidder/update'
  get 'bidder/destroy'
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
    resources :vacation_attractions, only: [:new, :create]
  end

  resources :categories, only: [:index, :show]
  resources :attractions
  resources :bucket_vacations, only: [:new, :create]



  get '/attractions/index', to: 'categories#index'

end
