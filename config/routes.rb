Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :memories
  devise_scope :user do
    get "/login" => "users/sessions#new"
    get "/logout" => "users/sessions#destroy"
    get "/register" => "users/registrations#new"
    get "/edit_profile" => "users/registrations#edit"
  end
  authenticate :user do
    resources :stories, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :stories, only: [:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
