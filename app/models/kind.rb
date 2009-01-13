class Kind < ActiveRecord::Base
  
  has_many :models, :dependent => :destroy
  
  validates_presence_of :name
  
end
