require 'spec_helper'

describe Attendance do

  #Associations
  it { should belong_to(:user)}
  it { should belong_to(:event)}

  #Database Field existence
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:is_paid).of_type(:boolean) }
end