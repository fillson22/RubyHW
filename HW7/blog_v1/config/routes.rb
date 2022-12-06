Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :authors, :articles do
        resources :comments
      end
      resources :tags, only: [:show, :index]
    end
  end

end
