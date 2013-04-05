class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def create
  end

  def new
  end

  def edit
    @user = User.find(current_user.id)
  end 

  def show
    @user = User.find(current_user.id)
  end 

  def update
    @user = User.find(current_user.id)
    @user.update_attributes(params[:user])
  end

  def logout
    reset_session
  end
end
