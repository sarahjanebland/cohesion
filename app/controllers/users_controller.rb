class UsersController < ApplicationController

  before_filter :auth_admin, only: [:destroy]
  skip_before_filter :auth, only: [:edit_cohort]

  def index
    if params[:cohort_id]
      @cohort = Cohort.find(params[:cohort_id])
      @users = @cohort.users
    else
      @users = User.all(:conditions => "photo_url != ''")
    end
  end

  def create
  end

  def new
  end

  def edit
    @user = User.find(current_user.id)
    @avatars = avatars_by_cohort(@user.cohort)
  end

  def show
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(current_user.id)
    @user.update_attributes(params[:user])

    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_path, :notice => "Successfully destroyed"
    else
      redirect_to users_path, :error => "There was an issue"
    end
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

  def cohort_reselect
    @user = current_user
    @cohorts = Cohort.all
  end

private

  def avatars_by_cohort(cohort)
    doc = Nokogiri::HTML(open(cohort.photos_url))
    doc.css("ol#gallery-view-media li img").map { |li| {src: li['data-src'], id: cohort.id} }
  end

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
