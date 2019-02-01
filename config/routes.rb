Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users do
        resources :projects do
          resources :tasks
        end
        get '/all_tasks'     => 'tasks#all_tasks'
      end 
      # log in page with form:
    	get '/login'     => 'sessions#new'
	
    	# create (post) action for when log in form is submitted:
    	post '/login'    => 'sessions#create'
	
    	# delete action to log out:
      delete '/logout' => 'sessions#destroy'  
      

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
