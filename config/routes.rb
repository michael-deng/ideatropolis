Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:index, :show]
  resources :ideas, only: [:index, :show]

  root "static_pages#home"

end
