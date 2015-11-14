Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :show]
  resources :ideas do
  	resources :comments, only: [:create, :update, :destroy]
    member do
      put "like", to: "ideas#upvote"
      put "dislike", to: "ideas#downvote"
    end
  end
  resources :notifications, only: [:index]
  resources :additional_registrations, only: [:edit, :update]
  resources :category_registrations, only: [:edit, :update]
  resources :categories, only: [:index, :show]

  root 'ideas#index'
  get 'static_pages/landing'

#  devise_scope :user do
#	  authenticated :user do
#	    root to: 'ideas#index', as: :authenticated_root
#	  end
#
#	  unauthenticated do
#      root to: 'static_pages#landing', as: :unauthenticated_root
#	  end
#	end
end
