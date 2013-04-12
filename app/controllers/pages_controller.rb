class PagesController < ApplicationController
  def index
    @user = User.featured
  end
end
