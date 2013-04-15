class CohortsController < ApplicationController
  def index
  	@cohort = Cohort.new
    @cohorts = Cohort.all
  end

  def show
  end

  def create  	
  	cohort_date = DateTime.new(params[:start_date]["start_date(1i)"].to_i, 
                        			params[:start_date]["start_date(2i)"].to_i,
                        			params[:start_date]["start_date(3i)"].to_i)

  	cohort = Cohort.new(params[:cohort].merge(start_date: cohort_date))
  	cohort.save
  end
end
