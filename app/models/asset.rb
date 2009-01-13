class Asset < ActiveRecord::Base

  belongs_to :user
  belongs_to :model
  belongs_to :location
  
  validates_presence_of :user
  validates_presence_of :model
  validates_presence_of :location

end
