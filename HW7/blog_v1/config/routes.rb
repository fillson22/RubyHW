Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :authors, :articles do
        resources :likes
        resources :comments do
          resources :likes
        end
      end
      resources :tags, only: [:show, :index]
    end
  end

end
