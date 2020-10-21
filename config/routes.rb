Rails.application.routes.draw do
  root 'jobs#index'
  
  resources :resumes
  resources :saved_jobs
  resources :jobs
  resources :users 


  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/sessions/logout', to: 'sessions#logout'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'
  post '/sessions/new_login', to: 'sessions#login'
end
