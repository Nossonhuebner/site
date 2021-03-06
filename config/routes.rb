Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index'
  resources :admin, only: [:create, :edit]
  resources :pages, only: :index
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
