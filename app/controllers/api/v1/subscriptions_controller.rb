class Api::V1::SubscriptionsController < ApplicationController

  def create
    # binding.pry
    @subscriptions = Subscription.new(endpoint: params[:endpoint], auth: params[:keys][:auth], p256dh: params[:keys][:p256dh])
    @subscriptions.save!
    render json: { success: 'YES', subscription: @subscriptions }
  end

  private

  def sub_params
    params.permit(:endpoint, :expirationTime, :keys, :format, :subscription)
  end
end