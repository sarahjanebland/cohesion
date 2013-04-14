class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_session_token(session[:token]) if session && session[:token]
  end
end
