class AttendancesController < ApplicationController

  def create
    @attendance = Attendance.new(event_id: params[:format], user_id: session[:user_id], is_paid: false)
    @attendance.save!
    redirect_to Event.find(params[:format])
  end

  def edit
    @attendance = Attendance.find(params[:id] )
  end

  def update
    @attendance_to_update = Attendance.find(params[:id])
    @attendance_to_update.update(attendance_params)
    redirect_to Event.find(@attendance_to_update.event_id)
  end

  def destroy
    @attendance = Attendance.find_by_user_id_and_event_id(session[:user_id], params[:id] )
    @attendance.destroy
    redirect_to Event.find(params[:id])
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id, :is_paid)
  end

end

