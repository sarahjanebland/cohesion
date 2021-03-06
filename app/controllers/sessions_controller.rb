class SessionsController < ApplicationController

  skip_before_filter :auth, only: :create

  def create
    auth = request.env["omniauth.auth"]
    p auth
    if auth.provider == "github"
      if session[:secret] && Cohort.find_by_secret_url(session[:secret])
        
        cohort = Cohort.find_by_secret_url(session[:secret])
        
        user = User.find_or_create_by_github_uid(
                    :github_uid => auth.uid,
                    :provider => auth.provider,
                    :email => auth.info.email,
                    :nickname => auth.info.nickname,
                    :first_name => auth.info.first_name || auth.info.name.split(' ').first,
                    :last_name => auth.info.last_name || auth.info.name.split(' ').last,
                    :location => auth.extra.raw_info.location,
                    :phone_number => auth.info.phone,
                    :company => auth.extra.raw_info.company,
                    :github_token => auth.credentials.token,
                    :blog_url => auth.extra.raw_info.blog || auth.info.urls['Blog'],
                    :cohort_id => cohort.id
                    )
        p user.errors
      else
        user = User.find_by_github_uid(auth.uid)
      end
    elsif auth.provider == 'facebook'
      user = current_user
      user.first_name = auth.info.first_name unless user.first_name
      user.last_name = auth.info.last_name unless user.last_name
      user.email = auth.info.email unless user.email
      user.facebook_url = auth.info.urls[:Facebook]
      bday = auth.extra.raw_info.birthday.split('/').map{|n| n.to_i }
      user.birthday = Date.new(bday[2], bday[0], bday[1])

      Provider.find_or_create_by_user_id_and_name(user: user, name: auth.provider, token: auth.credentials.token)
    elsif auth.provider == 'twitter'
      user = current_user
      user.first_name = auth.info.first_name unless user.first_name
      user.last_name = auth.info.last_name unless user.last_name
      user.email = auth.info.email unless user.email
      user.twitter_url = auth.info.urls[:Twitter]

      Provider.find_or_create_by_user_id_and_name(user: user, name: auth.provider, token: auth.credentials.token, secret: auth.credentials.secret)
    end
    
    if user
      session[:token] = user.session_token = SecureRandom.hex

      if user.save
        if auth.provider == 'facebook' || auth.provider == 'twitter' || !user.photo_url
          redirect_to edit_user_path(user)
        else
          redirect_to root_path, :notice => "Signed in!"
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
