Rails.application.routes.draw do

  resources :orders, only: [:index, :show]

  resources :cart, only: [:index] do
    collection do
      get 'checkout'
    end
    resources :movies, only: [:destroy,:update], controller: :cart do
      member do
        get 'plus'
        get 'minus'
      end
    end
  end

  devise_for :users
  resources :users, except: [:new, :create]

  resources :directors
  resources :actors
  resources :movies do
    member do
      get 'add-to-cart'
    end
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'store#index'
end
