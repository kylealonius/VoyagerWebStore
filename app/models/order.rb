class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst, :hst, :pst, :status
  
  #associations
  has_many :lineitems
  has_many :products, :through => :line_items
  belongs_to :customer
end
