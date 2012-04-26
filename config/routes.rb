WatsonTracker::Application.routes.draw do
  
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  
  match '/new_state(/:id)' => 'tasks#new_state'
  
  resource :session, :only => [:new, :create, :destroy]
  
  resources :tasks
  resources :users, :except => [:show, :destroy]
  
  root :to => 'sessions#new'
  
end
