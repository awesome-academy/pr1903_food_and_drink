Rails.application.routes.draw do
  resources :consumables
  resources :users
  root "users#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  scope "(:locale)", locale: /en|vi/ do
  	resources :users
  end

  root "static_pages#home"
end
