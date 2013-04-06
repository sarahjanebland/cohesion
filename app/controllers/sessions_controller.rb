class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:token] = user.session_token = SecureRandom.hex
    if user.save
      redirect_to root_url, :notice => "Signed in!"
    else
      redirect_to :back, :notice => "Please try again!"
    end
  end

  def destroy
    user = current_user
    session[:token] = user.session_token = nil
    if user.save
      redirect_to root_url, :notice => "Signed out!"
    else
      redirect_to :back, :notice => "Please try again!"
    end
  end

  
end
