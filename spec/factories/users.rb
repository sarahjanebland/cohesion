# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    cohort
    sequence(:github_uid) {|n| n }
    sequence(:github_token) {|n| "token#{n}" }
    first_name    "Joe"
    last_name     "Doe"
    nickname      "Jimmy D"
    sequence(:email) {|n| "user#{n}@mail.com" }
    phone         "123-555-1234"
    company       "Widget Co."
    location      "San Francisco, CA"
    advice        "Eat, Sleep, Program, Repeat"
    restaurant    "Pascilla"
    photo_url     "http://dropbox.com/images/photo.jpg"
    blog_url      "http://blog.com"
    website_url   "website.com"
    provider      "github"
    facebook_url  "http://facebook.com/username"
    twitter_url   "http://twitter.com/username"
  end
end
