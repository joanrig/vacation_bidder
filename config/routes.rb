Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :vacations
  resources :attractions
  resources :destinations
  resources :categories
  resources :users
    resources :bucket_list_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
