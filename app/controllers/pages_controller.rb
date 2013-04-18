class PagesController < ApplicationController

  before_filter :auth_admin, only: :admin
  skip_before_filter :auth, only: [:index, :random_user]
  respond_to :json, :html

  def index
    if current_user
      @users = User.current
    else
      @users = User.wise.shuffle
    end
    @cohort = Cohort.all
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
end
