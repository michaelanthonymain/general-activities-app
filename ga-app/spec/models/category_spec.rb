require 'spec_helper'

describe Category do
  it { should have_db_column(:name).of_type(:string)}
  it { should have_many(:events)}
end