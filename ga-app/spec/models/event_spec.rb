require 'spec_helper'

describe Event do
  it { should have_many(:attendances)}
  it { should have_many(:comments)}
  it { should have_many(:attendees).through(:attendances).source(:user)}
  it { should belong_to(:creator).class_name('User')}
  it { should belong_to(:category)}
end