require 'spec_helper'

describe Event do
  #Associations
  it { should have_many(:attendances)}
  it { should have_many(:comments)}
  it { should have_many(:attendees).through(:attendances).source(:user)}
  it { should belong_to(:creator).class_name('User').with_foreign_key(:user_id)}
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
end

