class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :nickname, :phone_number,
                  :company, :location, :advice, :restaurant, :website_url, :blog_url, 
                  :cohort_id, :photo_url, :github_uid, :provider, :github_token,
                  :facebook_url, :twitter_url, :linkedin_url
                  
  # validates :cohort_id, presence: true
  validates :github_uid, presence: true, uniqueness: true
  validates :github_token, presence: true
  # validates :email, format: {with: /[\w\-\.]+@[\w\-\.]+\.[\w]{2,7}/i}

  before_save :format_fields

  belongs_to :cohort
  has_one :admin

  def upload_avatar(photo_url)
    s3 = AWS::S3.new
    bucket = s3.buckets['bootconnect']
    file = open(photo_url)
    basename = "#{self.first_name}-#{SecureRandom.hex(14)}.png"
    o = bucket.objects[basename]
    o.write(:file => file)
    o.public_url.to_s
  end

  def format_fields
    self.facebook_url = self.facebook_url.gsub(/.*\//, '') if self.facebook_url
    self.twitter_url = self.twitter_url.gsub(/.*\//, '') if self.twitter_url
  end

  def phone_number=(num)
    self.phone = num.split('').select{|l| l =~ /\d/ }.join
  end

  def phone_number
    "#{self.phone[0..2]}-#{self.phone[3..5]}-#{self.phone[6..9]}"
  end

  def adminify!
    Admin.find_or_create_by_user_id(self.id)
  end

  def admin?
    Admin.exists?(user_id: self.id)
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def photo
    return photo_url if self.photo_url =~ /\w/
    return "/assets/default-profile-image.gif"
  end

  class << self
    def current
      Cohort.includes(:users).current.map { |cohort| cohort.users }.flatten
    end

    def pictured
      current.select{|user| user.photo_url }
    end

    def wise
      pictured.select{|user| user.advice && user.advice.length > 0 }
    end

    def featured
      wise.sample
    end
  end

  def to_s
    self.first_name
  end


end
