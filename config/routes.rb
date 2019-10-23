Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post   '/guest_admin/login', to: 'guest_admins#login', as: :guest_admin_login
  post   '/guest/login', to: 'guests#login', as: :guest_login
   
  resources :users do
    resources :tasks
  end
end
