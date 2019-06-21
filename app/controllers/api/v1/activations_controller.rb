class Api::V1::ActivationsController < ApplicationController


	def activate
		if params.has_key?(:activation_token)
			user = User.find_by_activation_token(params[:activation_token])
			if user
				user.activated = true
				user.activated_at = Time.now
				user.save
				render json: { message: "Account has successfully been activated."}, status: 200 
			else
				render json: { error: "Activation key is not valid."}, status: 400
			end
		else	
			render json: { error: "URL is not valid." }, status: 404
		end
	end

	def resend_activation_email
		current_user.send_activation_email
		render json: { message: "We’ve just sent you an email, please head there to verify your account."}, status: 200 
	end

end
