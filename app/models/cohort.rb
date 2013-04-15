require 'securerandom'

class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :email, :photos_url
  has_many :users

  validates :name,  presence: true, uniqueness: true
  validates :start_date,  presence: true, uniqueness: true
  validates :email,  presence: true, uniqueness: true, format: { with: /[\w\-\.]+@[\w\-\.]+\.[a-z]{2,7}/i }
  validates :secret_url, presence: true, length: {in: 6..12}, uniqueness: true

  before_validation :generate_secret_url
  # after_save :send_signup_email

  scope :current, lambda { where("start_date > ?", 12.weeks.ago) }

  def generate_secret_url
  	self.secret_url = SecureRandom.hex(6)
  end

  def send_signup_email
  	CohortMailer.signup_email(self).deliver
  end
end
