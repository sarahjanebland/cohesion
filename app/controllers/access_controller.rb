class AccessController < ApplicationController

  skip_before_filter :auth, only: :show
  
  def show
    @user = User.featured || User.new
    @cohort = Cohort.all
    
  	@cohort = Cohort.find_by_secret_url(params[:id])
  	if @cohort
      session[:secret] = params[:id]
  		
      redirect_to root_url
  	else
  		render :status => 401
  	end
  end
end
