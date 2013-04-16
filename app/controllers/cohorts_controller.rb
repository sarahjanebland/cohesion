class CohortsController < ApplicationController

  before_filter :auth_admin, except: [:show, :index]

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def new
    @cohort = Cohort.new
  end

  def create  	
  	cohort_date = DateTime.new(params[:start_date]["start_date(1i)"].to_i, 
                        			params[:start_date]["start_date(2i)"].to_i,
                        			params[:start_date]["start_date(3i)"].to_i)

  	cohort = Cohort.new(params[:cohort].merge(start_date: cohort_date))
  	cohort.save
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    cohort = Cohort.find(params[:id])
    cohort.update_attributes(params[:cohort])

    if cohort.save
      redirect_to cohort_path(cohort), :notice => "Successfully updated"
    else
      redirect_to edit_cohort_path(cohort), :error => "There was problem"
    end
  end

  def destroy
    cohort = Cohort.find(params[:id])
    if cohort.destroy
      redirect_to cohorts_path, :notice => "Successfully destroyed"
    else
      redirect_to cohorts_path, :error => "There was an issue"
    end
  end
end
