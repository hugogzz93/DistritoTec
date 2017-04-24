# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "12341234"
    password_confirmation "12341234"

    factory :admin do
    	credentials { User::credentials[:admin] }
    end
  end
end
