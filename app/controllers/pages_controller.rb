class PagesController < ApplicationController
  def index
    @user = User.featured || User.new
  end
end
