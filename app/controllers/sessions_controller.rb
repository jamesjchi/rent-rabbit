class SessionsController < ApplicationController
  def new
  end

  def create
  	# Determine if email/password combo is valid
  	@user = User.authenticate user_params[:email], user_params[:password]

  	# If valid create new session with @user.id
  	if @user 
  		session[:user_id] = @user.id
      flash[:success] = "Welcome Back " + @user.first_name
  		redirect_to root_path
  	# If not send back to login
  	else
  		flash[:danger] = "Invalid User Login"
  		redirect_to root_path
  	end
  end
  # Logout end session
  def destroy
  	session[:user_id] = nil
    flash[:success] = 'You Have Been Logged Out'
  	redirect_to root_path
  end

  private
  # list user params variable
  def user_params 
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :image, :location, :date_created, :avg_rating, :bio)
  end
end
