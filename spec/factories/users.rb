FactoryGirl.define do
	sequence(:email) {|n| "email#{n}@email.com"}

  factory :user do
    email
    username	"username"
    password	"password" 
    first_name "Ron"
    last_name "Gertz"
  end
end