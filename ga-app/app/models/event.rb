class Event < ActiveRecord::Base
  has_many :attendances
  has_many :comments
  has_many :attendees, through: :attendances, source: :user
  belongs_to :creator, class_name: "User"
  belongs_to :category

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

  end

end




  