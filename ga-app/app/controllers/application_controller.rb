class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # puts "The current user in application controller is #{@current_user.name} and token: #{@current_user.oauth_token}"
  
  helper_method :current_user
end
