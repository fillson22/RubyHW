# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do

  authenticate :admin_user do
    mount Sidekiq::Web, at: '/sidekiq'
  end
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart

  resources :products
  resources :categories
  resources :line_items, only: %i[create update destroy]

  resources :orders
  get '/orders/:id/paid', to: 'orders#paid', as: 'order_paid'
end
