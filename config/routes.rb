Rails.application.routes.draw do
  devise_for :installs
  resources :attractions
  resources :categories
  resources :users
    resources :bucket_list_items
  resources :vacations, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get root to: 'users#new'

end
