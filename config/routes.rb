Rails.application.routes.draw do
  resources :memories
  resources :stories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
