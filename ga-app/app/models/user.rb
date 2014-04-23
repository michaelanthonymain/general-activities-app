class User < ActiveRecord::Base
  has_many :attendances
  has_many :attended_events, through: :attendance, source: :events
  has_many :created_events, class_name: "Event"
end
