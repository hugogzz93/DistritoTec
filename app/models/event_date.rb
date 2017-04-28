class EventDate < ApplicationRecord
	belongs_to :event
	has_many :event_registrations, dependent: :destroy
	has_many :users, through: :event_registrations
	has_many :visitor_registrations, -> { where(special_type: EventRegistration::special_types['visitor']) }, class_name: 'EventRegistration'
	has_many :vendor_registrations, -> { where(special_type: EventRegistration::special_types['vendor']) }, class_name: 'EventRegistration'
	has_many :host_registrations, -> { where(special_type: EventRegistration::special_types['host']) }, class_name: 'EventRegistration'
	has_many :hosts, through: :host_registrations, source: :user
	has_many :visitors, through: :visitor_registrations, source: :user
	has_many :merchants, through: :vendor_registrations, source: :user
	default_scope { order(date: :desc) }

	def register(user)
		event_registrations.create user_id: user.id, special_type: user.special_type
	end

	def registration_for(user)
		event_registrations.find_by(user_id: user)
	end
end
