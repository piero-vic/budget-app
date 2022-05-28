Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :transactions, only: [:new, :create, :destroy]
  end

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'home#index'
  end
end
