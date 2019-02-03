class Api::V1::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
      @users = User.all
    end

    def show

    end
    
    # New user
    def new
       @user = User.new
    end
    
    # Create user
    def create
      @user = User.new(user_params)
      if @user.save
        render :json => 201
      else
        render :json => { :errors => @user.errors.full_messages }
      end
    end
      
    
    private
    
      def user_params
        # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
        # that can be submitted by a form to the user model #=> require(:user)
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
      end
      
    # ----- end of added lines -----
end