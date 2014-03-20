Splittrack::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :payments, only: [:create]

  root :to => "home#index"
end
