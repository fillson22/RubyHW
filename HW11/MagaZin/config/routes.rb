# frozen_string_literal: true

Rails.application.routes.draw do
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

  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#destroy', as: 'line_item'
  get 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  get 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'

end
