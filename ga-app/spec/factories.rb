# require 'spec_helper'

# FactoryGirl.define do
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
# end