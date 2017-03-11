class EventDate < ApplicationRecord
	belongs_to :event
	has_many :event_registrations

	def register(user)
		registration = event_registrations.new user_id: user.id
		registration.save
	end
end
