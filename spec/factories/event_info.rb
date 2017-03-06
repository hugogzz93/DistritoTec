# This will guess the User class
FactoryGirl.define do
  factory :event_info do
    event
    title { FFaker::Book.title }
    description { FFaker::DizzleIpsum.paragraph }
  end
end
