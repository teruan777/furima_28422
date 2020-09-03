Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  get 'items/shadow_search' 
  get 'items/search'
  resources :items do
    resources :purchases, only:[:index, :create]
    resources :keeps, only:[:create, :destroy]
    resources :comment, only: [:new, :create]
  end
  resources :keeps, only:[:index]
end
