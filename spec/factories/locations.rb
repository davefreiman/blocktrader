# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    address "MyString"
    postal_code "MyString"
    lattitude 1.5
    longitude 1.5
  end
end
