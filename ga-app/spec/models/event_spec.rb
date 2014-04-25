require 'spec_helper'

describe Event do
  #Associations
  it { should have_many(:attendances)}
  it { should have_many(:comments)}
  it { should have_many(:attendees).through(:attendances).source(:user)}
  it { should belong_to(:creator).class_name('User')}
  it { should belong_to(:category)}

  #Database Columns
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:category_id).of_type(:integer) }
  it { should have_db_column(:price).of_type(:decimal) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:signup_start).of_type(:datetime) }
  it { should have_db_column(:signup_end).of_type(:datetime) }
  it { should have_db_column(:event_start).of_type(:datetime) }
  it { should have_db_column(:event_end).of_type(:datetime) }
  it { should have_db_column(:uses_paypal).of_type(:boolean) }
  it { should have_db_column(:recurring_events).of_type(:boolean) }
  it { should have_db_column(:recurring_timeframe).of_type(:string) }

  context "creates a recurring event (copy of event)" do 
    let(:event) { FactoryGirl.build(:event)}

    it "returns event with same name" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.name).to eq "Test Event"
    end

    it "returns event with same description" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.description).to eq "Testing with a factory"
    end    

    it "returns event with same category_id" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.category_id).to eq 1
    end

    it "returns event with same uses_paypal" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.uses_paypal).to eq true
    end

    it "returns event with same recurring_timeframe" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.recurring_timeframe).to eq "weekly"
    end

    it "returns event with signup_start forwarded the specified recurring timeframe" do 
      recurring_event = Event.create_recurring_event(event)
      puts "recurring event: #{recurring_event.inspect}"

      expect(recurring_event.signup_start).to eq(Time.new(2014, 4, 26, 2, 30, 30) + 1.week)
    end

    it "saves a recurring event in the database" do 
      recurring_event = Event.create_recurring_event(event)

      expect(recurring_event.id).should_not be_nil
    end
  end

end
