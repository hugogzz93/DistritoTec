class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :registrations, through: :event_dates, dependent: :destroy
end
