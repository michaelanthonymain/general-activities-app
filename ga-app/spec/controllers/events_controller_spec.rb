require 'spec_helper'

describe EventsController do

  context "events#create" do 

    it "it saves event user specified number of times in database" do 
      user = User.create(name: "Amelia", email: "amelia@amelia.com")
      session[:user_id] = user.id
      number_of_occurences = 5
      
      post :create, user_id: session[:user_id], event: {
        name: "Test Event",
        description: "Testing with a factory",
        category_id: 1,
        price: 2.00,
        user_id: 1,
        signup_start: Time.new(2014, 4, 26, 2, 30, 30),
        signup_end: Time.new(2014, 4, 26, 2, 30, 30) + 1.day,
        event_start: Time.new(2014, 4, 26, 2, 30, 30) + 2.days,
        event_end: Time.new(2014, 4, 26, 2, 30, 30) + 3.days,
        uses_paypal: true,
        recurring_events: true,
        recurring_timeframe: "weekly",
        number_of_occurrences: number_of_occurences
      }

      events = Event.where(name: "Test Event")
      expect(events).should have(number_of_occurences).items
    end

  end

end