# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
  	sequence(:name)   {|n| "cohort#{n}" }
  	sequence(:start_date) {|n| Date.today + n }
  	sequence(:email)  {|n| "test#{n}@email.com" }
  	photos_url        "http://dropbox.com"
  	secret_url        SecureRandom.hex(6)
  end
end
