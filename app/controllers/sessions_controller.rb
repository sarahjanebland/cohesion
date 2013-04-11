class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    p auth
    user = User.find_or_create_by_github_uid(
                :github_uid => auth.uid,
                :provider => auth.provider,
                :email => auth.info.email,
                :nickname => auth.info.nickname,
                :first_name => auth.info.first_name || auth.info.name.split(' ').first,
                :last_name => auth.info.last_name || auth.info.name.split(' ').last,
                :location => auth.extra.raw_info.location,
                :phone => auth.info.phone,
                :github_token => auth.credentials.token,
                :blog => auth.extra.raw_info.blog || auth.info.urls['Blog']
                )
    
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
