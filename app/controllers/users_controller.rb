class UsersController < ApplicationController

  # before_action :is_authenticated?

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

  def edit
  end

  def update
    @user = User.find params[:id]
    @user.update(user_params)
  end

  def show
    @user = User.find params[:id]
    @item = @user.item
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :image, :location, :bio)
  end

end
