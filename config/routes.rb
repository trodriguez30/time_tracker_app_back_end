Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users do
        resources :projects do
          resources :tasks
        end
        get '/all_tasks'     => 'tasks#all_tasks'
      end 
      # log in 
    	get '/login'     => 'sessions#new'
	
    	# Log in
    	post '/login'    => 'sessions#create'
	
      

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
