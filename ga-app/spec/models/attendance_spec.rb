# require 'spec_helper'

<<<<<<< HEAD
# describe Attendance do
#   it { should belong_to(:user)}
#   it { should belong_to(:event)}
# end
=======
describe Attendance do

  #Associations
  it { should belong_to(:user)}
  it { should belong_to(:event)}

  #Database Field existence
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:is_paid).of_type(:boolean) }
end
>>>>>>> e162bfa2413cc69cc8d73f50c12c2ed3597f0f6e
