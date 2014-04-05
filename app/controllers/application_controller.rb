class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def main_form
  	@main_form ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
