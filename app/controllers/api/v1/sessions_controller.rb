class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    
      def new
        # No need for anything in here, we are just going to render our
        # new.html.erb AKA the login page
      end
    
      # Log In
      def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id.to_s
          render :json => user.id
        else
          render :json => 422
        end
      end
      
    end