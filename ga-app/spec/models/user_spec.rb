require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:comments)}
  it { should have_many(:attendances)}
  it { should have_many(:attended_events).through(:attendances).source(:event) }
  it { should have_many(:created_events).class_name('Event')}
end