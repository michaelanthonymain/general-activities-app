require 'spec_helper'

describe User do
	it { should have_db_column(:name).of_type(:string) }
	it { should have_db_column(:is_admin).of_type(:boolean).with_options(default: false) }
	it { should have_db_column(:avatar_url).of_type(:string) }
	it { should have_db_column(:email).of_type(:string) }
	it { should have_db_column(:cohort).of_type(:string) }
	it { should have_db_column(:oauth_token).of_type(:string) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:comments)}
  it { should have_many(:attendances)}
  it { should have_many(:attended_events).through(:attendances).source(:event) }
  it { should have_many(:created_events).class_name('Event')}

end