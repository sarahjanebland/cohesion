class Provider < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :secret, :token
end
