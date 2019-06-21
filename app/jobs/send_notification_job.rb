class SendNotificationJob < Struct.new(:type, :type_id, :title, :message, :registration_ids)
  include PushNotificationUtils

  def perform
    send_notifications(type, type_id, title, message, registration_ids)
  end
end