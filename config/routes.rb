Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :products, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :products, only: [:index, :show]
  namespace :owner do
    resources :products, only: [:new, :create, :show]
  end
end
