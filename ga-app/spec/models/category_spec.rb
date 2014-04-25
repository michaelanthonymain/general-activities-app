# require 'spec_helper'

<<<<<<< HEAD
# describe Category do
#   it { should have_many(:events)}
# end
=======
describe Category do
  it { should have_db_column(:name).of_type(:string)}
  it { should have_many(:events)}
end
>>>>>>> e162bfa2413cc69cc8d73f50c12c2ed3597f0f6e
