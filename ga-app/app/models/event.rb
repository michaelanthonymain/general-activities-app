class Event < ActiveRecord::Base
  has_many :attendances
  has_many :comments
  has_many :attendees, through: :attendances, source: :user
  belongs_to :creator, class_name: "User"
  belongs_to :category

  def self.create_recurring_event(last_event)

    event = Event.new(name: last_event.name)

  end

end




  