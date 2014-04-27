class AttendancesController < ApplicationController
	
  def create
    @attendance = Attendance.new(event_id: params[:format], user_id: session[:user_id], is_paid: false)
    @attendance.save!
    redirect_to Event.find(params[:format])
	end

	def destroy
		@attendance = Attendance.find_by_user_id_and_event_id(session[:user_id], params[:id] )
    @attendance.destroy
    redirect_to Event.find(params[:id])
	end
end
