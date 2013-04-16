class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery

  helper_method :current_user

  before_filter :auth

  private

  def current_user
    if Rails.env.test?
      @current_user ||= User.find(cookies[:user]) if cookies[:user]
    else
      @current_user ||= User.find_by_session_token(session[:token]) if session && session[:token]
    end
  end

  def auth
    redirect_to :root unless current_user
  end
end
