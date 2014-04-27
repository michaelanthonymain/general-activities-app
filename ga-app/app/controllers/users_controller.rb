class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@attended_events = @user.attended_events
		@created_events = @user.created_events
    @all_events = Event.all
    puts "all events: #{@all_events.inspect}"
	end
end