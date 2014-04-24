class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge(user_id: params[:user_id]))
		# @event.save
			if @event.save!
				redirect_to @event
			else
				render "new"
			end		
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
		params.require(:event).permit(:name, :description, :category_id, 
																	:price, :user_id, :signup_start, 
																	:signup_end, :event_start, :event_end,
																	:uses_paypal)
	end
end