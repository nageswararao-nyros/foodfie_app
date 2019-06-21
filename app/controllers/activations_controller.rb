class ActivationsController < ApplicationController


	def index
		if params.has_key?(:activation_token)
			user = User.find_by_activation_token(params[:activation_token])
			if user && !user.activated
				user.activated = true
				user.activated_at = Time.now
				user.save!
				@success = true
			else
				@success = false
			end
		else	
			@success = false
		end
	end

end
