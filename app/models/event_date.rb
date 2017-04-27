class EventDate < ApplicationRecord
	belongs_to :event
	has_many :event_registrations, dependent: :destroy
	has_many :users, through: :event_registrations
	default_scope { order(created_at: :desc) }

	def register(user)
		event_registrations.create user_id: user.id, special_type: user.special_type
	end
end
