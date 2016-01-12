class UsersController < ApplicationController

  before_action :is_authenticated?, except: [:new, :create]

  # before_action :is_authenticated?

  def new
  end

  def create
    # Create new user if valid
    @user = User.create(user_params)

    puts @user.errors.inspect

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Created"
      redirect_to root_path
    elsif !EmailValidator.valid?(@user.email)
       flash[:danger] = "The email you entered is invalid"
       redirect_to root_path
    else
      messages = @user.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ').gsub(/_/, ' ')
      redirect_to root_path
    end
  end

  def edit
    @user = User.find params[:id]
    @user.update_attributes(update_user_params)
    redirect_to @user
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :location, :bio)

  end

end
