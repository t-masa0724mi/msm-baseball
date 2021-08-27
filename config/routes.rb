Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root 'posts#index'

  resources :users, only: [:show]
  resources :posts, only: [:index, :new, :create]
end
