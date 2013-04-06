class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :nickname, :phone, 
                  :job, :location, :advice_tweet, :fav_restaurant, :url, :blog, 
                  :cohort_id, :photo_url, :uid, :provider, :github_token

  belongs_to :cohort
end
