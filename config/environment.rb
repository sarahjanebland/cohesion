# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Phaseboot::Application.initialize!

# config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => 25,
  :domain					=> "127.0.0.1:3000",
  :user_name      => "hankjohnson2000@gmail.com",
  :password       => "mvclover7829",
  :authentication => :login
}
ActionMailer::Base.raise_delivery_errors = true