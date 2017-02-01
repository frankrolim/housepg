Rails.application.routes.draw do

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
