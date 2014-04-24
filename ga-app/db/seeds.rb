# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

def rand_int(from, to)
  rand_in_range(from, to).to_i
end

def rand_price(from, to)
  rand_in_range(from, to).round(2)
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

Category.create(name: "Arts & Culture")
Category.create(name: "Community & Environment")
Category.create(name: "Dancing")
Category.create(name: "Education & Learning")
Category.create(name: "Fitness")
Category.create(name: "Food & Drink")
Category.create(name: "Games")
Category.create(name: "Hobbies & Craft")
Category.create(name: "Movies & Film")
Category.create(name: "Music")
Category.create(name: "Outdoors & Adventure")
Category.create(name: "Photography")
Category.create(name: "Tech")
Category.create(name: "Other")


5.times do
  User.create(is_admin: false, 
  						name: Faker::Name.name, 
  						email: Faker::Internet.email, 
  						cohort: Faker::Team.creature, 
  						avatar_url: "http://www.gravatar.com/avatar/6f7587bc566de4570e5a63a84ad234b3.png", 
  						oauth_token: Faker::Lorem.characters(30) 
  						)
end

users = [1, 2, 3, 4, 5]
events = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
boolean = [true, false]
categories = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

15.times do
  Event.create(name: Faker::Company.name, 
  						 description: "This is a description.", 
  						 category_id: categories.sample, 
  						 price: rand_price(10, 50), user_id: users.sample, 
  						 signup_start: rand_time(2.days.ago), 
  						 signup_end: 2.days.from_now, 
  						 event_start: 3.days.from_now, 
  						 event_end: 4.days.from_now, 
  						 uses_paypal: false 
  						 )
end

25.times do
  Attendance.create(user_id: users.sample, 
  									event_id: events.sample, 
  									is_paid: boolean.sample )
end

20.times do
  Comment.create(user_id: users.sample, 
  							 event_id: events.sample, 
  							 content: "This is a comment.")
end



