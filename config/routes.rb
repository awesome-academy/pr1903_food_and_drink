Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get 'cart_items/create'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'carts/show'
    get 'static_pages/about'
    get 'static_pages/home'
    post '/rate' => 'rater#create', :as => 'rate'
    resources :consumables, only: [:index, :show]
    resources :users
    resources :ratings
    resources :categories
    resources :carts
    resources :cart_items

    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
  	resources :users
    resources :categories do
      member do
        get :of_categories
      end
    end
    namespace :admin do
      resources :consumables, except: :show
      resources :users
    end
  end
end
