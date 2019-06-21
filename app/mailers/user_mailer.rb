class UserMailer < ApplicationMailer
  default from: 'Peppa <hello@peppa.io>'

  def send_activation_email(user)
    binding.pry
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: 'Account activation for Peppa'
  end

	def send_password_reset_email(user)
		@user = user
		mail to: user.email, subject: 'Password reset token for Peppa'
	end

end
