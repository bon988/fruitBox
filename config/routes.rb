Rails.application.routes.draw do
  root 'projects#index', as: 'home'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'edit', to: 'users#edit', as: 'edit'
  get 'login', to: 'sessions#new', as: 'login'
  
  post 'login', to: 'sessions#create'
  
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'welcome', to: 'sessions#welcome', as: 'welcome' 
  
  get 'authorized', to: 'sessions#page_requires_login'
  
  get 'about' => 'pages#about', as: 'about'

 
 
  #so that tasks is nested within projects
  resources :projects do 
  resources :tasks
 end
end
