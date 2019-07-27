Rails.application.routes.draw do

  devise_for :users
  #devise_for :users, controllers: {passwords: 'users/passwords', sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'locker#splash'
  get "locker_sign_in", to: 'locker#sign_in'
  get 'logout', to: 'locker#logout'
  post 'pindex', to: 'locker#index'
  get 'view',   to: 'locker#view'
  post 'view', to: 'locker#many_new'
  match 'sort/:type', to: 'locker#sort', :via => :get, :as => :sort
  resources :locker
end
