class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		
	end

	def create
		
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		
	end

	def destroy
		
	end

	private

	def event_params
    # CODE REVIEW: are you sure you want :user_id assignable by an end user?
    # That's what you imply when you "permit" params, "this param is OK for
    # an end user to provide and to be mass-assigned to this object"
		params.require(:event).permit(:name, :description, :category, 
																	:price, :user_id, :signup_start, 
																	:signup_end, :event_start, :event_end,
																	:uses_paypal)
	end
end