Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :create]
  # post 'items/new', to: 'items#create'
  
end
