Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  get 'items/shadow_search' 
  get 'items/search'
  # get 'items/:id', to: 'items#checked'
  resources :items do
    resources :purchases, only:[:index, :create]
  end
end
