# config/routes.rb
Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create, :index, :destroy, :show]
  end

  resources :bookmarks, only: [:show, :destroy]

  resources :movies

  root "lists#index"
end
