class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :github_username, :phone, :job, :city, :advice_tweet, :fav_restaurant, :url, :blog, :cohort_id, :photo_url
  belongs_to :cohort

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      
  # validates :last_name,  presence: true
  # validates :cohort_id,  presence: true
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  #           uniqueness: { case_sensitive: false }
 
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
