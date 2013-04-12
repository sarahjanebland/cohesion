# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
  	sequence(:name)   {|n| "cohort#{n}" }
  	start_date        Date.today
  	sequence(:email)  {|n| "test#{n}@email.com" }
  	photos_url        "http://dropbox.com"
  	secret_url        SecureRandom.hex(6)
  end
end
