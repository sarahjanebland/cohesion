class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :nickname, :phone, 
                  :company, :location, :advice, :restaurant, :website_url, :blog_url, 
                  :cohort_id, :photo_url, :github_uid, :provider, :github_token,
                  :facebook_url, :twitter_url

  before_save :format_urls

  belongs_to :cohort

  # searchable do
  #   text :first_name, :last_name, :nickname
  # end

  def format_urls
    self.facebook_url = self.facebook_url.gsub(/.*\//, '') if self.facebook_url
    self.twitter_url = self.twitter_url.gsub(/.*\//, '') if self.twitter_url
  end

  def self.current
    Cohort.includes(:users).current.map { |cohort| cohort.users }.flatten
  end

  def self.pictured
    current.select{|user| user.photo_url }
  end

  def self.wise
    pictured.select{|user| user.advice }
  end
end
