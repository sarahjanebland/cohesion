class PagesController < ApplicationController
  def index
    @user = User.featured || User.new
    @cohort = Cohort.all
    
    # @users = User.all
    if request.method == "GET"
    	@users = User.all
  	else
	    search = User.search({:first_name_or_last_name_or_nickname_cont => params[:search], :cohort_name_cont => params[:view][:cohort]})
  		@users = search.result
  	end
  end
end
