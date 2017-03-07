class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :registrations, through: :event_dates, dependent: :destroy

  def next_date
  	next_event_date.date
  end

  def next_event_date
  	event_dates.order('date desc').last
  end

end
