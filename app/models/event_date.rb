class EventDate < ApplicationRecord
	belongs_to :event
	has_many :event_registrations
	has_many :users, through: :event_registrations
	default_scope { order(created_at: :desc) }

	def register(user)
		registration = event_registrations.new user_id: user.id
		registration.save
	end
end
