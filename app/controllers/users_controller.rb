class UsersController < ApplicationController

  def index
    @existing_users = User.all(:conditions => "photo_url != ''")
    @slugs = User.all(:conditions => "cohort_id = 6")
    @bears = User.all(:conditions => "cohort_id = 7")
    @skippers = User.all(:conditions => "cohort_id = 8")
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

  def query
    search = User.search do
      fulltext params[:phrase]
    end
    p search.results
    render json: search.results
  end

  private

  def avatars
    imgs = []
    
    Cohort.all.each do |cohort|
      if cohort.photos_url
        doc = Nokogiri::HTML(open(cohort.photos_url))
        imgs << doc.css("ol#gallery-view-media li img").map { |li| {src: li['data-src'], id: cohort.id} }
      end
    end

    imgs.flatten
  end
end
