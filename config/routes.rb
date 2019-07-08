Rails.application.routes.draw do
  resources :categories
  # resources :agencies
  resources :hotels do
    resources :reports
  end

  resources :countries
  # resources :hotel_chains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
