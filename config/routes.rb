Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :games, only: [:index, :show]
  post 'games', to: 'games#create'
  patch 'games/:id', to: 'games#update'
end
