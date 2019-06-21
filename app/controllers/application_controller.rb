class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  include PaginationHelper
  include ActionController::HttpAuthentication::Token::ControllerMethods
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  

  # def welcome
  #   render html: "<h1>Welcome to Peppa! A new way to find out what's best for eating.</h1>".html_safe
  # end

  protected
  def request_http_token_authentication(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    # render :json => {:error => "HTTP Token: Access denied."}, :status => :unauthorized
  end

  def get_base_url
    request.base_url
  end

  private
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      !!User.find_by_authentication_token(token)
    end
  end

  # def is_active_user
  #   if !current_user.activated
  #     return render json: { success: 'No', message: "You'll need to validated your email to post on Peppa. To do this, click on the link in the email we sent you when you signed up", mail_confirmation: true}, status: 422
  #   end
  # end

  def un_rated_dishes
    dishes = current_user.dishes.includes(:ratings, :dishes_users, :restaurant)
    @un_rated_dishes = 0
    dishes.map{|dish| !dish.reposted(current_user) && dish.rating_by(current_user).try(:weight).present? ? nil : (dish.restaurant.present? ? @un_rated_dishes+=1 : nil)}
  end

  def is_by_distance
    params[:sort_by] == "Distance"
  end

  def is_by_tags
    params[:meals].present? || params[:dietarian].present?
  end

  def is_by_rating
    params[:rating].present? || params[:sort_by].to_s.downcase == 'rating'
  end

 
end
