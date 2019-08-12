Rails.application.routes.draw do

devise_for :users
devise_scope :user do 
  get '/users/sign_out' => 'devise/sessions#destroy'
end

  root to: 'locker#splash'
  get 'view',   to: 'locker#view'
  post 'view', to: 'locker#many_new'
  match 'sort/:type', to: 'locker#sort', :via => :get, :as => :sort
  match 'sort/sort/:type', to: 'locker#sort', :via => :get, :as => :sortsort
  resources :locker
end
