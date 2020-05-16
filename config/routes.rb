Rails.application.routes.draw do
 
 root 'projects#index', as: 'home'
 
 get 'about' => 'pages#about', as: 'about'
 
 resources :projects
end
