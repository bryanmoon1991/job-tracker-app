Rails.application.routes.draw do
  resources :resumes
  resources :saved_jobs
  resources :jobs
  get '/job_search' => 'jobs#new_search'
  post '/job_search' => 'jobs#create_search'
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
