class PagesController < ApplicationController
  def index
    @user = User.featured || User.new
    @cohort = Cohort.all
    search = User.search({:first_name_or_last_name_or_nickname_cont => params[:search], :cohort_name_cont => params[:view][:cohort]})
    
 		p "^" * 300
    p @users = search.result
  end
end
