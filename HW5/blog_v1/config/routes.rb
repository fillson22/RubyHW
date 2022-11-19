Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do #методы, пути и методы контроллера
      post '/articles', to: 'articles#create'
      get '/articles', to: 'articles#index'
      get '/articles/:id', to: 'articles#show'
      patch '/articles/:id', to: 'articles#update'
      delete '/articles/:id', to: 'articles#destroy'
    end
  end
  
end
