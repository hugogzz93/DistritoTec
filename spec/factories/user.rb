# This will guess the User class
FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "12345678"
    password_confirmation "12345678"

    factory :admin do
    end
  end
end
