class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
  has_many :event_dates, dependent: :destroy
  has_many :event_registrations, through: :event_dates, dependent: :destroy
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
  	edate = EventDate.new event_id: self.id, date: date
  	edate.save
  end

  def register(user)
    begin
      next_event_date.register user
    rescue
      false
    end
  end
end
