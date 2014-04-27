class Event < ActiveRecord::Base
  has_many :attendances
  has_many :comments
  has_many :attendees, through: :attendances, source: :user
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  belongs_to :category

  validates_presence_of :name

  def self.create_recurring_event(last_event)

    if last_event.recurring_timeframe == "weekly"
      event_start = last_event.event_start + 1.week
      event_end = last_event.event_end + 1.week
      signup_start = last_event.signup_start + 1.week
      signup_end = last_event.signup_end + 1.week
    elsif last_event.recurring_timeframe == "monthly"
      event_start = last_event.event_start + 1.month
      event_end = last_event.event_end + 1.month
      signup_start = last_event.signup_start + 1.month
      signup_end = last_event.signup_end + 1.month
    end

    event = Event.new(
      name: last_event.name,
      description: last_event.description,
      category_id: last_event.category_id,
      price: last_event.price,
      user_id: last_event.user_id,
      uses_paypal: last_event.uses_paypal,
      recurring_events: last_event.recurring_events,
      recurring_timeframe: last_event.recurring_timeframe,
      event_start: event_start,
      event_end: event_end,
      signup_start: signup_start,
      signup_end: signup_end
      )

    if event.save
      event
    else
      raise "Unable to save event in the database"
    end

  end

  def self.set_up_recurring_event(last_event, number_of_occurences)
    number_of_occurences = number_of_occurences.to_i - 1
    number_of_occurences.times do
      last_event = Event.create_recurring_event(last_event)
    end
  end

  def price_per_person
    attendee_count = self.attendees.length
    attendee_count = 1 if self.attendees.length == 0
    self.price / attendee_count
  end

end





