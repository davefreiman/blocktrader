# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    notice "MyString"
    user_id 1
    auction_id 1
  end
end
