class WebPushJob < Struct.new(:subscribers)
  def perform
    message = { title: "New dish added in #{@dish.restaurant.name}", body: "Lets try !!!!!!!!!!"}
    # subscriptions = Subscription.all
    binding.pry
    subscribers.each do |subscriber|
      Webpush.payload_send(
        endpoint: subscriber.endpoint,
        message: JSON.generate(message),
        p256dh: subscriber.p256dh,
        auth: subscriber.auth,
        vapid: {
          subject: "mailto:sender@example.com",
          public_key: 'BGaBmbHJz7l_KvpfcPLCDCfY6kQZtDRRFGSjp8YV7j4tG6s7yTHRvL4up1dFIyfMhCJYFn_Op5F_KkuI9mHPPJ0',
          private_key: 'XfX_OWSXUIpldH0UwtWJY8QALCpDOyrg3fWOhRilKqI'
        }
      )
    end
  end
end