Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :consumables
  resources :users
  resources :ratings
  resources :categories

  root "users#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  scope "(:locale)", locale: /en|vi/ do
  	resources :users
  end
  resources :categories do
    member do
      get :of_categories
    end
  end

  root "static_pages#home"
end
