Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :authors, :articles do
        resources :likes
        resources :comments do
          resources :likes
        end
      end
      resources :tags
    end
  end
end
