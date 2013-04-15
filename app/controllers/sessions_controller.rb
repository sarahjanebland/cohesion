class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    if session[:secret] && Cohort.find_by_secret_url(session[:secret])
      user = User.find_or_create_by_github_uid(
                  :github_uid => auth.uid,
                  :provider => auth.provider,
                  :email => auth.info.email,
                  :nickname => auth.info.nickname,
                  :first_name => auth.info.first_name || auth.info.name.split(' ').first,
                  :last_name => auth.info.last_name || auth.info.name.split(' ').last,
                  :location => auth.extra.raw_info.location,
                  :phone => auth.info.phone,
                  :company => auth.extra.raw_info.company,
                  :github_token => auth.credentials.token,
                  :blog_url => auth.extra.raw_info.blog || auth.info.urls['Blog']
                  )
    else
      user = User.find_by_github_uid(auth.uid)
    end
    
    if user
      session[:token] = user.session_token = SecureRandom.hex

      if user.save
        if user.photo_url
          redirect_to root_path, :notice => "Signed in!"
        else
          redirect_to edit_user_path(user)
        end
      else
        redirect_to :root, :notice => "Please try again!"
      end
    else
      redirect_to :root, :notice => "You do not have access to sign up."
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
