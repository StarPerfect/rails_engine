Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :transactions do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
      namespace :invoice_items do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
      namespace :invoices do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
      namespace :customers do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
      namespace :items do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
      namespace :merchants do
        get 'find', to: 'search#find'
        get 'find_all', to: 'search#find_all'
      end
    end
  end

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
