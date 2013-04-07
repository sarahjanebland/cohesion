class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :nickname, :phone, 
                  :job, :location, :advice_tweet, :fav_restaurant, :url, :blog, 
                  :cohort_id, :photo_url, :uid, :provider, :github_token,
                  :facebook, :twitter

  before_save :format_urls

  belongs_to :cohort

  def format_urls
    self.facebook = self.facebook.gsub(/.*\//, '')
    self.twitter = self.twitter.gsub(/.*\//, '')
  end
end
