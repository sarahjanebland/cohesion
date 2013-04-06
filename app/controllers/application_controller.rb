class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_session_token(session[:token]) if session[:token]
  end
end
