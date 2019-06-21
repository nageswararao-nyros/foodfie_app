class Api::V1::SettingsController < ApplicationController

  def share_text
    @settings = Setting.last
    render json: {status: "success", share_text: @settings.share_text}
  end

  def settings_info
    user = current_user
    settings = {fav_restaurant: user.fav_restaurant, fav_dish: user.fav_dish, post_by_follow_user: user.post_by_follow_user, starts_following: user.starts_following}
    render json: {status: "success", settings: settings}
  end

  def notification_settings
    current_user.assign_attributes(notification_params)
  	current_user.save(validate: false)
  	render json: {status: "success", message: "Notifications saved!"}
  end

  private

  def notification_params
    params.require(:user).permit(:fav_restaurant, :fav_dish, :post_by_follow_user, :starts_following)
  end

end
