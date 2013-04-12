class AccessController < ApplicationController
  def show
  	cohort = Cohort.find_by_secret_url(params[:id])
  	if cohort
  		render :pages => "index"
      session[:auth_secret] = cohort.secret_url
  	else
  		render :status => 401
  	end
  end
end
