class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :name, presence: true

	has_many :comments
	has_many :attendances
	has_many :attended_events, through: :attendances, source: :event
	has_many :created_events, class_name: "Event"
end