class EventDate < ApplicationRecord
	belongs_to :event
	has_many :registrations
end
