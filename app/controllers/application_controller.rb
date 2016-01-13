class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_main_authenticated?
  	unless current_user

  	end
  end

  def is_authenticated?
    unless current_user
      flash[:danger] = "You Must Be Logged In"
      redirect_to root_path
    end
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end
end
