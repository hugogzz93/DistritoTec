# This will guess the User class
FactoryGirl.define do
  factory :event_date do
  	event
  	date { Time.zone.now }
  end
end
