Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:index, :show]
  resources :ideas do
  	resources :comments, only: [:create, :update, :destroy]
  end
  resources :notifications, only: [:index]

  devise_scope :user do
	  authenticated :user do
	    root 'ideas#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
end
