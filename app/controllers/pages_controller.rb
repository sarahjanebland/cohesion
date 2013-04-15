class PagesController < ApplicationController

  skip_before_filter :auth, only: :index

  def index
    @user = User.featured || User.new
  end
end
