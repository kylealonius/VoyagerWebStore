class Lineitem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  
  #associations
  belongs_to :product
  belongs_to :order
  
  validates :order_id, :price, :product_id, :quantity, presence: true
end
