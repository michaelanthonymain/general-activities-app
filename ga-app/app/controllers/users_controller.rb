class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@attended_events = @user.attended_events
		@created_events = @user.created_events
	end

  def new

  end
end