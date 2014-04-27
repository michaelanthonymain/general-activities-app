require 'spec_helper'

FactoryGirl.define do

  factory :user, aliases: [:creator, :attendee] do
    name "TestUser"
    sequence(:email) { |n| "#{name}#{n}@example.com"}
  end

  factory :admin_user, parent: :user do
    is_admin true
  end

  factory :category do
    name "TestCategory"

    factory :category_with_events do
      ignore do
        events_count 5
      end

      after(:create) do |category, evaluator|
        create_list(:event, evaluator.events_count, category: category)
      end
    end
  end

  factory :event do
    category
    creator
    name "Test Event"
    description "Testing with a factory"
    category_id 1
    price 2.00
    user_id 1
    signup_start Time.new(2014, 4, 26, 2, 30, 30)
    signup_end Time.new(2014, 4, 26, 2, 30, 30) + 1.day
    event_start Time.new(2014, 4, 26, 2, 30, 30) + 2.days
    event_end Time.new(2014, 4, 26, 2, 30, 30) + 3.days
    uses_paypal true
    recurring_events true
    recurring_timeframe "weekly"
  end

  factory :attendance do
    user
    event
    is_paid "true"
  end

  factory :comment do
    user
    event
    content "This is a test comment"
  end

#   factory :admin, class: User do
#     is_admin true
#     name "Admin User"
#     sequence(:email) {|n| "admin#{n}@example.com"}
#   end
end

