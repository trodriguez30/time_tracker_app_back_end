class Api::V1::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token
      def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        puts @user
        if @user.save
          render :json => {text: 'Sign Up Successful', status: 201}
        else
          render :json => {text: 'Something iss wrong, try again', status: 422}
        end
      end
      
    
    private
    
      def user_params
        # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
        # that can be submitted by a form to the user model #=> require(:user)
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      
    # ----- end of added lines -----
end