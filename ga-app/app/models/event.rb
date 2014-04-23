class Event < ActiveRecord::Base
  has_many :attendances
  has_many :attendees, through: :attendance, source: :users
  belongs_to :creator, class_name: "User", foreign_key: :user_id
end
