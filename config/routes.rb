Rails.application.routes.draw do
 
 root 'projects#index', as: 'home'
 
 get 'about' => 'pages#about', as: 'about'
 
  #so that tasks is nested within projects
 resources :projects do 
  resources :tasks
 end
 

end
