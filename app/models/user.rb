class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :event_registrations, dependent: :destroy
  enum credentials: [:client, :admin]
  enum special_type: [:visitor, :vendor, :host]
end
