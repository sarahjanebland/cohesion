class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :email, :dropbox_url
  has_many :users

  validates :name,  presence: true
  validates :start_date,  presence: true
  validates :email,  presence: true
end