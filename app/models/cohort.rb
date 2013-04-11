require 'securerandom'

class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :email, :photos_url
  has_many :users

  validates :name,  presence: true
  validates :start_date,  presence: true
  validates :email,  presence: true

  before_create :generate_secret_url
  after_save CohortMailer.signup_email(cohort).deliver

  def generate_secret_url
  	self.secret_url = SecureRandom.hex(6)
  end
end
