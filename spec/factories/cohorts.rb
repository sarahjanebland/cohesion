# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
  	name "skippers"
  	start_date "Time.now"
  	email "test@email.com"
  	photos_url "http://dropbox.com"
  	secret_url "slkdfjd323fd"
  end
end
