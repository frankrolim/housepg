Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]

  resources :directors
  resources :actors
  resources :movies do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'store#index'
end
