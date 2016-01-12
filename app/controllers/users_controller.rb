class UsersController < ApplicationController
  before_action :is_authenticated?, except: [:new, :create]
 
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
