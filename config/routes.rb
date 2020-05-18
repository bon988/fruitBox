Rails.application.routes.draw do
  root 'projects#index', as: 'home'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'about' => 'pages#about', as: 'about'
 
  #so that tasks is nested within projects
  resources :projects do 
  resources :tasks
 end
end
