require 'spec_helper'

describe Comment do

  # Database field existence
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:content).of_type(:text) }  

  # Associations
  it {should belong_to(:user)}
  it {should belong_to(:event)}

end