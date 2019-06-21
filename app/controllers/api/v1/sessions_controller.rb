class Api::V1::SessionsController < ApplicationController
  before_action :restrict_access, only: :destroy
  def create
    # binding.pry
    if params && params.has_key?(:user)
      email_or_username = params[:user][:username]
      user = User.where("email = ? or username = ?", email_or_username, email_or_username).try(:first)
      begin
        if user && user.authenticate(params[:user][:password])
          #user.set_authentication_token
          user.set_device_token params[:user][:device_id]
          render json: {
              message: "You have successfully signed in.",
              authentication_token: user.authentication_token,
              user: user
          }, status: 200
        else
          render json: { message: "Your username and password combination is incorrect, please check and try again." }, status: 200
        end
      rescue BCrypt::Errors::InvalidHash => e
        render json: { message: "Your username and password combination is incorrect, please check and try again." }, status: 200
      end
    else
      render json: { message: "You are not sending the params in correct order." }, status: 200
    end
  end

  def destroy
    token = request.headers['Authorization'].scan(/token=(.*)/).first.first
    user = User.find_by_authentication_token(token)
    user.authentication_token = nil
    user.save
    render json: { message: "You have successfully signed out of this application" }
  end

  private

  def check_activated
    if params && params.has_key?(:user)
      unless User.find_by_email(params[:user][:email]).try(:activated)
        return render json: { message: "Please activate your account first" }
      end
    end
  end
end
