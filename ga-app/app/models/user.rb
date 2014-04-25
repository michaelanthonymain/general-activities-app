class User < ActiveRecord::Base
  has_many :attendances
  has_many :comments
  has_many :attended_events, through: :attendances, source: :event
  has_many :created_events, class_name: "Event"

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
end
