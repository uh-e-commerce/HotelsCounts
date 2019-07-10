Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  # get 'home/index'
  # get 'home/about'
  # get 'home/error'

  # resources :categories
  # resources :agencies
  resources :hotels do
    resources :reports, only: [:new, :create, :update, :edit, :destroy]
  end

  resources :countries
  # resources :hotel_chains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
