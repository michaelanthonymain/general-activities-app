class Event < ActiveRecord::Base
  has_many :attendances
  has_many :comments
  has_many :attendees, through: :attendances, source: :user
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  belongs_to :category

end
