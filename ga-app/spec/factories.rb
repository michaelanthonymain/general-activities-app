require 'spec_helper'

FactoryGirl.define do
#   factory :user do
#     is_admin false
#     name "Test User"
#     sequence(:email) { |n| "#{cohort}#{n}@example.com"}
#   end

#   factory :admin, class: User do
#     is_admin true
#     name "Admin User"
#     sequence(:email) {|n| "admin#{n}@example.com"}
#   end

  factory :event do
    name "Test Event"
    description "Testing with a factory"
    category_id 1
    price 2.00
    user_id 1
    signup_start Time.now
    signup_end Time.now + 1.day
    event_start Time.now + 2.days
    event_end Time.now + 3.days
    uses_paypal true
    recurring_events true
    recurring_timeframe "weekly"
  end
end