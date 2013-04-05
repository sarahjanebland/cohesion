class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :job, :city, :advice_tweet, :fav_restaurant, :url, :blog
  belongs_to :cohort

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      
  validates :last_name,  presence: true
  validates :cohort_id,  presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }



  user = User.find_or_create_by_github_token(
    :github_token => 
    )
end
