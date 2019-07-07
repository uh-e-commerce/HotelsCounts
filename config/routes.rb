Rails.application.routes.draw do
  resources :reports
  resources :categories
  resources :agencies
  resources :hotels
  resources :hotel_chains
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
