Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :items do
        get 'find', to: 'search#find'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#find'
      end
    end
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], to: 'merchants/items#index'
      end

      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
