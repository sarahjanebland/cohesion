class Cohort < ActiveRecord::Base
  attr_accessible :name, :start_date, :email
  has_many :users

  # validates :name,  presence: true
  # validates :start_date,  presence: true
  # validates :group_email,  presence: true
end

