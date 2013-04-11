# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
  	name "skippers"
  	start_date = Date.today
  	email "test@email.com"
  	photos_url "http://dropbox.com"
  	secret_url "2j3kffd5493p"
  end
end
