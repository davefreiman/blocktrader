# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    name "MyString"
    duration 1
    start_price 1
    description "MyText"
  end
end
