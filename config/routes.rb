ContactManager::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :contacts

  match 'signup',  :to => 'users#new'
  match 'login',  :to => 'sessions#new'
  match 'logout', :to => 'sessions#destroy'

  match 'contacts/:id/copy', :to => 'contacts#copy'

  root :to => 'users#index'

end
