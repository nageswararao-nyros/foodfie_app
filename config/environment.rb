# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   address: 'smtp.sendgrid.net',
#   port: '587',
#   authentication: :plain,
#   user_name: ENV['SENDGRID_USERNAME'],
#   password: ENV['SENDGRID_PASSWORD'],
#   domain: 'heroku.com',
#   enable_starttls_auto: true
# }

# ActionMailer::Base.smtp_settings = {
#   :address => "email-smtp.us-east-1.amazonaws.com",
#   :port => 587,
#   :user_name => "AKIAI77NXXNFSLVEHL7Q", #Your SMTP user
#   :password => "Al2sCul4YuhPDZ5ts9JQrzl+vnp1zllshO6kiMSuTvzM", #Your SMTP password
#   :authentication => :login,
#   :enable_starttls_auto => true
# }
