class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :group_email
  has_many :users

  validates :name,  presence: true
  validates :start_date,  presence: true
  validates :group_email,  presence: true
end

