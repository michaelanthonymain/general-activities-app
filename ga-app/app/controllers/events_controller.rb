class EventsController < ApplicationController
	def index
    puts "in event index"
    @current_user = current_user
    puts "current user is: #{@current_user}"
    puts "=================================================="
    puts "the sesion has #{session.inspect}"
    if current_user
    	@events = Event.all
    else
      redirect_to sessions_new_path
    end
	end

	def show
		@event = Event.find(params[:id])
	end
end