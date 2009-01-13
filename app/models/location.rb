class Location < ActiveRecord::Base
  
  has_many :assets
  
  validates_presence_of :name

end
