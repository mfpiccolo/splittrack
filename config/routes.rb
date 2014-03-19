Splittrack::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "new_home#index"
  resources :users, only: [:index, :show, :edit, :update ] do
    get :autocomplete_user_name, :on => :collection
    resources :receivables, only: [] do
      collection do
        get :approved_index
        get :unapproved_index
      end
    end
    resources :payables, only: [] do
      collection do
        get :approved_index
        get :unapproved_index
      end
    end
  end

  resources :payments
  resources :payment_instances

  resources :split_payments, only: [:new, :create]
  resources :contact_relations, only: [:create]

  # # Session routes
  # get '/auth/dwolla/callback' => 'sessions#create'
  # get '/signin' => 'sessions#new', as: :signin
  # get '/signout' => 'sessions#destroy', as: :signout
  # get '/auth/failure' => 'sessions#failure'

end
