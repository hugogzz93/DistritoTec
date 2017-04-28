class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
  has_many :event_dates, inverse_of: :event, dependent: :destroy
  has_many :event_registrations, through: :event_dates, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", small: "150x150>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  # after_create :create_date

  accepts_nested_attributes_for :event_dates

  def last_date
    next_date = next_event_date
    begin
      if next_date
        next_date.date
      else
        event_dates.order('date desc')
                 .last
                 .date
      end
    rescue
    end
  end

  def last_date_formatted
    begin
      last_date.strftime("%B %d, %Y")
    rescue
    end
  end

  def users
    next_event_date.users
  end

  def next_date
  	next_event_date.date
  end

  def next_event_date
  	event_dates.where('date >= :now', now: Time.zone.now)
               .order('date')
               .first
  end

  def create_date(date = Time.zone.now)
  	edate = EventDate.new event_id: self.id, date: date
  	edate.save
  end

  def register(user, event_date = next_event_date)
    begin
      event_date.register user
    rescue
      false
    end
  end
end
