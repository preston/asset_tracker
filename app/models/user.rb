class User < ActiveRecord::Base
  
  has_many :assets, :dependent => :destroy
  
  validates_presence_of :login
  validates_presence_of :email

end
