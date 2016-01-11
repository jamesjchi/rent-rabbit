class UsersController < ApplicationController
  def new
  end

  def create
    # Create new user if valid 
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Created"
      redirect_to root_path
    else
      flash[:danger] = "Invalid Credentials"
      redirect_to root_path
    end
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private 

  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
