class Location < ActiveRecord::Base
  
  has_many :assets
  
  validates_presence_of :name
  validates_uniqueness_of :name

end
