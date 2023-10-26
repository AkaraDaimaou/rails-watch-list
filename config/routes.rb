Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

  resources :bookmarks, only: [:show, :edit, :update]

  root 'lists#index'

end
