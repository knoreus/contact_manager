ContactManager::Application.routes.draw do

  resources :users

  resources :sessions, :only => [:new, :create, :destroy]

  match 'signup',  :to => 'users#new'
  match 'login',  :to => 'sessions#new'
  match 'logout', :to => 'sessions#destroy'

  root :to => 'users#index'

end
