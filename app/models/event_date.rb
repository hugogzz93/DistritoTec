class EventDate < ApplicationRecord
	belongs_to :event
	has_many :event_registrations, dependent: :destroy
	has_many :users, through: :event_registrations
	default_scope { order(created_at: :desc) }

	def register(user)
		registration = event_registrations.new user_id: user.id, special_type: user.special_type
		registration.save
	end
end
