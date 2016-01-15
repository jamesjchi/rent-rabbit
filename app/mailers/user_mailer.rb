class UserMailer < ApplicationMailer
  def password_reset user, hostname
    @user = user
    @hostname = hostname
    mail to: user.email
  end
end
