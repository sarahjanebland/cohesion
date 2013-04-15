class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  before_filter :auth

  private

  def current_user
    @current_user ||= User.find_by_session_token(session[:token]) if session && session[:token]
  end

  def auth
    unless Rails.env.test? && cookies[:signed_in]
      redirect_to :root unless current_user
    end
  end
end
