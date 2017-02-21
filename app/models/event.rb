class Event < ApplicationRecord
  has_many :event_info, dependent: :destroy
end
