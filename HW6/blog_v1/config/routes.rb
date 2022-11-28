Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/authors/:author_id/comments', to: 'authors#author_index'
      resources :authors, :articles do
        resources :comments
      end
      
    end
  end

end
