class Api::V1::RegistrationsController < ApplicationController

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      user.set_authentication_token
      render json: { message: "Welcome to Peppa #{user.first_name}!\nPlease head to your email to verify your account.", authentication_token: user.authentication_token, user: user }, status: 200
    else
      render json: { errors: [user.errors.full_messages.first]}, status: 200
    end
  end

  def forget_password
    if params && params.has_key?(:email) && User.find_by_email(params[:email])
      user = User.find_by_email(params[:email])
      user.set_password_reset_token
      user.send_password_reset_email
      render json: { message: "We’ve emailed you a link! Head to your inbox to reset your password." }
    else
      render json: { message: "The email doesn't exist in our record." }
    end
  end

  def reset_password
    @error = true
    if params && params.has_key?(:email) && params.has_key?(:new_password) && params.has_key?(:reset_password_token) && (params[:new_password] == params[:new_password_confirmation])
      user = User.find_by_email(params[:email])
      if user && (user.reset_password_token == params[:reset_password_token])
        user.password = params[:new_password]
        user.save
        user.update_attribute :reset_password_token, nil
        @msg = "Password has been reset"
        @error = false
      else
        @msg = "Reset password token is not correct."
      end
    else
      @msg = "Sorry, there is something wrong."
    end
  end

  def show_reset_password
    @user = User.find_by(reset_password_token: params[:reset_password_token]) if params[:reset_password_token]
  end

  def terms_url
     render json: { url: "https://docs.google.com/document/d/1fwNOj2s57pxIA48U5MSfYav1dmrKyJZNnC2bj_0zC30/edit" }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :device_id).compact.reject { |k,v| v.nil? || v.empty? }
  end
end
