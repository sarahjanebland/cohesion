class PagesController < ApplicationController
  def index
    @user = User.featured || User.new

    @q = User.search(params[:q])
    @users = @q.result
  end
end
