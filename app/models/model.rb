class Model < ActiveRecord::Base
  
  belongs_to :kind
  belongs_to :manufacturer
  
  has_many :assets, :dependent => :destroy
  
  validates_presence_of :kind
  validates_presence_of :manufacturer
  validates_presence_of :name
end
