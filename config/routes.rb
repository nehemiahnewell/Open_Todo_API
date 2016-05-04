Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :lists
      end

      resources :lists, only: [] do
        resources :items, only: [:create]
      end

      resources :items, only: [:destroy]
    end
  end
end
