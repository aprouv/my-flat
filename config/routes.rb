Rails.application.routes.draw do
  root to: 'pages#home'
  resources :rooms, only: [:index, :show, :new, :create, :destroy] do
    resources :fournitures, only: [:create]
  end
  resources :fournitures, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
