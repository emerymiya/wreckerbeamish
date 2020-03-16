Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'privacy', to: 'pages#privacy'
  get 'community', to: 'pages#community'
  get 'packages', to: 'pages#packages'
  get 'contact', to: 'pages#contact'
  resources :products, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :products, only: [:index, :show]
  namespace :owner do
    resources :products, only: [:new, :create, :show]
  end
end
