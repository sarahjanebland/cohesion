class Provider < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :secret, :token, :user
  
  validates :name, :presence => true
  validates :token, :presence => true
end
