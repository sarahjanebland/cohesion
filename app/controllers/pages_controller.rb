class PagesController < ApplicationController

  skip_before_filter :auth, only: :index

  def index
    @user = User.featured || User.new

    
  	# cohort = Cohort.find_by_secret_url(params[:id])
  	# if cohort
  	# 	render :status => 401
  	# else
  	# 	render :status => 401
  	# end

  end
end
