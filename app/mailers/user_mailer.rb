class UserMailer < ActionMailer::Base
  default from: 'info@railstart.de'

  def activation_needed_email(user)
    @user = user
    @url  = "#{ENV["APP_URL"]}/users/#{user.activation_token}/activate"
    mail(to: user.email,
         subject: 'Welcome to railstart')
  end

  def activation_success_email(user)
    @user = user
    @url  = "#{ENV["APP_URL"]}/login"
    mail(to: user.email,
         subject: 'Your account is now activated')
  end

  def reset_password_email(user)
    @user = user
    @url  = "#{ENV["APP_URL"]}/password_resets/#{user.reset_password_token}/edit"
    mail(to: user.email,
         subject: 'Your password reset request')
  end
end
