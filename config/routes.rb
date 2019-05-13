Rails.application.routes.draw do
  root 'locker#splash'
  match   'locker/view/:id', to: 'locker#view', :via => :get, :as => :view
  resources :locker
end
