Rails.application.routes.draw do
 
 root 'projects#index', as: 'home'
 
 get 'about' => 'pages#about', as: 'about'
 
  #so that tasks in nested within projects
  #example so url is projects/1/tasks/1
 resources :projects do 
  resources :tasks
 end
 

end
