Rails.application.routes.draw do
  resources :resumes
  resources :saved_jobs
  resources :jobs
  resources :users 
  
  get '/search' => 'search#search'
  resources :search
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
