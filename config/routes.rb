Rails.application.routes.draw do
  resources :vacations
  resources :attractions
  resources :destinations
  resources :categories
  resources :travelers
    resources :bucket_list_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
