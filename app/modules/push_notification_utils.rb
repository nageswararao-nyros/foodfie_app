module PushNotificationUtils

  ACTIVITY_CLASS = "com.foodfie.nyros.Activity.RestaurantProfileActivity"


  def send_notifications(type, type_id, title, message, registration_ids)
    if registration_ids.present?
      push_json = {
        'notification' => {
          "title" => title,
          "body" => message,
          "icon" => "notification_icon",
          "color" => "#073257",
        },
        "data" => {
          "title" => title,
          "message" => message,
          "tickerText" => {
            "activity_class" => ACTIVITY_CLASS,
            "activity" => type,
            "id" => type_id
          }
        },
        "registration_ids" => registration_ids
      }.to_json
      RestClient.post "https://fcm.googleapis.com/fcm/send",  push_json, {content_type: :json, accept: :json, authorization: ENV['FCM_KEY']}
    else
      false
    end
  end


end