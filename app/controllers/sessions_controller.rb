class SessionsController < ApplicationController
  def new
  end

  def create
  	# Determine if email/password combo is valid
  	@user = User.authenticate user_params[:email], user_params[:password]

  	# If valid create new session with @user.id
  	if @user 
  		session[:user_id] = @user.id
  		redirect_to root_path
  	# If not send back to login
  	else
  		flash[:danger] = "Invalid Credentials. Try Again"
  		redirect_to root_path
  	end
  end
  # Logout end session
  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  private
  # list user params variable
  def user_params 
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :image, :location, :date_created, :avg_rating, :bio)
  end
end
