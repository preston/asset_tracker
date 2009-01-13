class User < ActiveRecord::Base
  
  has_many :assets, :dependent => :destroy
  
  validates_presence_of :login
  validates_uniqueness_of :login
  
  validates_presence_of :email

end
