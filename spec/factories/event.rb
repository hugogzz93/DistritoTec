# This will guess the User class
FactoryGirl.define do
  factory :event do
    title { FFaker::Book.title }

    after(:create) do |event|
      create :event_date, event_id: event.id
      create :event_info, event_id: event.id
    end
  end
end
