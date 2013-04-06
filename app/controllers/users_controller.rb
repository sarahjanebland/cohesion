class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def create
  end

  def new
  end

  def edit
    @user = User.find(current_user.id)
    @cohorts = Cohort.all
    doc = Nokogiri::HTML(open('https://www.dropbox.com/sh/unxdinxldakcyc8/2_BhxGIPPw/gravatars'))
    @images = doc.css("ol#gallery-view-media li img").map do |li|
      li['data-src']
  end
    
  end 

  def show
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(current_user.id)
    @user.update_attributes(params[:user])

    redirect_to "/users/#{current_user.id}"
  end

  def logout
    reset_session
  end
end
