class AccessController < ApplicationController
  def show
  	cohort = Cohort.find_by_secret_url(params[:id])
  	if cohort
      session[:secret] = params[:id]
  		render :pages => "index"
  	else
  		render :status => 401
  	end
  end
end
