Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
