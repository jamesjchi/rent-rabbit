class UsersController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @user = User.find params[:id]
    @user.update(user_params)
    redirect_to show_users_path
  end

  def update

  end

  def show
    @user = User.find params[:id]
    @item = @user.item
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :image, :location, :bio)
  end
end
