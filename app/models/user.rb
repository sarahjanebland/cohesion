class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :nickname, :phone, 
                  :company, :location, :advice, :restaurant, :website_url, :blog_url, 
                  :cohort_id, :photo_url, :github_uid, :provider, :github_token,
                  :facebook, :twitter

  before_save :format_urls

  belongs_to :cohort

  # searchable do
  #   text :first_name, :last_name, :nickname
  # end

  def format_urls
    self.facebook = self.facebook.gsub(/.*\//, '') if self.facebook
    self.twitter = self.twitter.gsub(/.*\//, '') if self.twitter
  end
end
