Rails.application.routes.draw do

  get 'transactions/index'

  get 'accounts/index'

  get 'dashboard', to: 'dashboard#index'
  devise_scope :user do
    root :to => 'users/sessions#new'
  end
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :beneficiaries do
    collection do
      get 'all_accounts', to: 'beneficiaries#all_accounts'
    end
  end

  resources :accounts do
    collection do
      post 'recharge_account', to: 'accounts#recharge_account'
    end
  end

  resources :transactions do
    collection do
      #get 'all_accounts', to: 'transactions#all_accounts'
      get 'update_status', to: 'transactions#update_status'
    end
    member do
      get 'complete_transaction', to: 'transactions#complete_transaction'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
