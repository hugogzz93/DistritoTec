class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :registrations, through: :event_dates, dependent: :destroy
  after_create :create_date

  def next_date
  	next_event_date.date
  end

  def next_event_date
  	event_dates.where('date >= :now', now: Time.zone.now)
               .order('date desc')
               .last
  end

  def create_date(date = Time.zone.now)
  	edate = EventDate.new
  	edate.event_id = self.id
  	edate.date = date
  	edate.save
  end

end
