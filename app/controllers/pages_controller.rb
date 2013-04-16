class PagesController < ApplicationController

  skip_before_filter :auth, only: :index
  before_filter :auth_admin, only: :admin

  def index
    @user = User.featured || User.new
  end

  def admin
  end
end
