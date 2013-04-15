class AccessController < ApplicationController
  def show
    @user = User.featured || User.new
  	@cohort = Cohort.find_by_secret_url(params[:id])
  	if @cohort
      session[:secret] = params[:id]
      @cohort = Cohort.all
      @users = User.all
  		render "pages/index"
  	else
  		render :status => 401
  	end
  end
end
