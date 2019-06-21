class Api::V1::AuthenticationsController < ApplicationController
  
  before_action :restrict_access, only: :destroy

    def create
      authentication = Authentication.find_by_provider_and_uid(params[:provider], params[:uid])
      if authentication
        #authentication.user.set_authentication_token
        authentication.user.set_device_token params[:device_id]
        render json: {
          success: "Yes",
          message: "You have succesfully signed in.",
          authentication_token: authentication.user.authentication_token
        }, status: 200
      elsif current_user
        current_user.authentications.create!(:provider => params[:provider], :uid => params[:uid])
        current_user.set_device_token params[:device_id]
        render json: {
          success: "Yes",
          message: "Authentication successfully added."
        }, status: 200
      else
        user = User.find_by_email(params[:email])
        user.set_device_token params[:device_id]
        unless user
          user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
          user.generate_random_username!
          user.provider = params[:provider]
        end
        user.authentications.build provider: params[:provider], uid: params[:uid]
        if user.save(validate: false)
          user.set_authentication_token
          render json: {
            success: "Yes",
            message: "You have succesfully signed in.",
            authentication_token: user.authentication_token,
            user: user
          }, status: 200
        else
          render json: {
            success: "No",
            messages: "There is a problem in signing in.",
            errors: user.errors.messages
          }, status: 422
        end
      end
    end

  def destroy
    authentication = current_user.authentictions.find(params[:id])
    if authentication.destroy
      render json: { success: 'Yes', message: 'Authentication was successfully destroyed.' }, status: 200
    else
      render json: { success: 'No', message: 'Authentication has not been destroyed.' }, status: 422
    end
  end
end
