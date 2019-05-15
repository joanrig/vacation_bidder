Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :views
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :vacations

  resources :attractions
  resources :categories, only: [:index, :show]
  resources :users
  resources :bucket_list_items


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end


end
