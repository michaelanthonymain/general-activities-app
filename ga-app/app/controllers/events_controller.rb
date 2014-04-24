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
		@event = Event.find_by_user_id_and_id(params[:user_id], params[:id])
	end

	def update
		@event_to_update = Event.find(params[:id])
		@event_to_update.update(event_params)
		redirect_to @event_to_update
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