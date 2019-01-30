class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    
      def new
        # No need for anything in here, we are just going to render our
        # new.html.erb AKA the login page
      end
    
      def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
          render :json=> {text: "Succesful", status: 200}
        else
          render :json => {text: "Invalid email/password combination", status: 422}
        end
      end
    
      def destroy
        # delete the saved user_id key/value from the cookie:
        session.delete(:user_id)
        redirect_to login_path, notice: "Logged out!"
      end
      
    # ----- end of added lines -----
    end