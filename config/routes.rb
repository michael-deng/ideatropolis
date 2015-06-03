Rails.application.routes.draw do
  
  get 'notifications/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:index, :show]
  resources :ideas do
  	resources :comments, only: [:create, :edit, :update, :destroy]
  end

  root "static_pages#home"

end
