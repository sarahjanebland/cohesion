class CohortsController < ApplicationController
  def index
  	@cohort = Cohort.new
    @cohorts = Cohort.all
  end

  def show
  end

  def create  	
  	cohort_date = DateTime.new(params[:cohort]["start_date(1i)"].to_i, 
                        			params[:cohort]["start_date(2i)"].to_i,
                        			params[:cohort]["start_date(3i)"].to_i)

  	@cohort = Cohort.new(name: params[:cohort][:name], email: params[:cohort][:email], photos_url: params[:cohort][:photos_url])
  	@cohort.start_date = cohort_date
  	if @cohort.save
      redirect_to :root, :notice => "New cohort #{@cohort.name} was created!"
    else
      redirect_to :root, :notice => "Cohort was not created, please go back and ensure all fields are filled in correctly."
    end
  end
end
