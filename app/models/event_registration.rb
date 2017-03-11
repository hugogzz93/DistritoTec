class EventRegistration < ApplicationRecord
	belongs_to :event_date
	belongs_to :user
	validates :user_id, uniqueness: { scope: :event_date_id, 
																		message: 'User is already registered' }

	def event
		event_date.event
	end
end