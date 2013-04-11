# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider do
    user nil
    name "MyString"
    token "MyString"
    secret "MyString"
  end
end
