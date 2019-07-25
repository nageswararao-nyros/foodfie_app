class SubscriptionsController < ApplicationController

  def create
    binding.pry
    @subscriptions = Subscription.new(sub_params)
    @subscriptions.save
  end

  private

  def sub_params
    params.permit(:endpoint)
  end
end
