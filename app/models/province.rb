class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  
  #associations
  has_many :customers
end
