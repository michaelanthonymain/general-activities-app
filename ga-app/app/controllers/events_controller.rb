class EventsController < ApplicationController
	def index
    if current_user
    	@events = Event.all
    	@categories = Category.all
    else
      redirect_to sessions_new_path
    end
	end

	def show
		@event = Event.find(params[:id])
		attendance = Attendance.where(user: current_user, event: @event).first
		attendance ? @attending = true : @attending = false
		@comment = Comment.new
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge(user_id: params[:user_id]))

		if @event.save!
			ModelMailer.new_event_notification(@event, current_user.email).deliver
			redirect_to @event
		else
			render "new"
		end
		
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
		@event = Event.destroy(params[:id])
		redirect_to user_path(params[:user_id])
	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :category_id,
																	:price, :user_id, :signup_start,
																	:signup_end, :event_start, :event_end,
																	:uses_paypal)
	end
end