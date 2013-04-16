class PagesController < ApplicationController

  before_filter :auth_admin, only: :admin
  skip_before_filter :auth, only: [:index, :random_user]
  respond_to :json, :html

  def index
    @user = User.featured || User.new
    @cohort = Cohort.all
    
    @users = User.all
  	
  end

  def search
    search = User.search({:first_name_or_last_name_or_nickname_cont => params[:search], :cohort_name_cont => params[:view][:cohort]})
    users = search.result
    if users.present?
      render :json => render_to_string(:partial => "pages/results", :locals => {:users => users}).to_json
    else
      render :json => { error: "No Users Found" }
    end
  end
  
  def admin
  end

  def random_user
    user = User.all.sample
    render :json => render_to_string(:partial => "pages/home_users", :locals => {:user => user}).to_json
  end
end
