class UsersController < ApplicationController

  def index
    @users = User.all
    @avatars = avatars
  end

  def create
  end

  def new
  end

  def edit
    @user = User.find(current_user.id)
    @cohorts = Cohort.all
    @avatars = avatars
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

  private

  def avatars
    doc = Nokogiri::HTML(open('https://www.dropbox.com/sh/unxdinxldakcyc8/2_BhxGIPPw/gravatars'))
    doc.css("ol#gallery-view-media li img").map { |li| li['data-src'] }

    doc1 = Nokogiri::HTML(open('https://www.dropbox.com/sh/unxdinxldakcyc8/2_BhxGIPPw/gravatars'))
    doc1.css("ol#gallery-view-media li img").map { |li| li['data-src'] }
  end

  # def avatars2
  #   doc = Nokogiri::HTML(open('https://www.dropbox.com/sh/unxdinxldakcyc8/2_BhxGIPPw/gravatars'))
  #   doc.css("ol#gallery-view-media li img").map { |li| li['data-src'] }
  # end
end
