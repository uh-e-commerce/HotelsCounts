Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resource :countries, only: [:new, :create, :update]

  resources :hotel_chains do
    resources :hotels
  end

  get '/hotels', action: :index, controller: :hotels

  resources :hotels do
    get '/new_report', action: :build_report, controller: :reports
    resources :reports, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  resources :reports, only: [:show]

  resources :agencies
  resources :countries

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
