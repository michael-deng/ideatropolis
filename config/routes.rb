Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :show]
  resources :ideas do
  	resources :comments, only: [:create, :update, :destroy]
  end
  resources :notifications, only: [:index]
  resources :additional_registrations, only: [:edit, :update]
  resources :category_registrations, only: [:edit, :update]
  resources :categories, only: [:index, :show]

  devise_scope :user do
	  authenticated :user do
	    root 'ideas#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
end
