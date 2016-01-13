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

  def edit
    # @user = User.find params[:id]
    # uploaded = params[:user][:image].path
    # cloud_file = Cloudinary::Uploader.upload(uploaded)
    # if (File.exists?(uploaded))
    #   File.delete(uploaded)
    # end
    # userUpload = @user.update({:image => cloud_file["public_id"]})
    # userUpload.save
    # @user.update_attributes(update_user_params)
    # if @user.save
    #   redirect_to @user
    # else
    #   flash[:danger] = "Please Enter Password"
    #   redirect_to @user
    # end
  end

  def update
    user = User.find params[:id]
    user.update update_user_params

    # Update image, if user uploaded an image.
    if params[:user][:image]
      uploaded_image = params[:user][:image].path
      cloud_file = Cloudinary::Uploader.upload(uploaded_image)
      user.update({:image => cloud_file["public_id"]})
    end

    redirect_to user
  end

  def show
    @user = User.find params[:id]
    @item = @user.item
    @review = Review.all
    puts "hello"
    puts @review
    puts "goodbye"
  end

  def destroy
  end

  private


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image, :location, :bio)
  end

end
