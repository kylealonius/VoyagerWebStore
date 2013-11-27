class Product < ActiveRecord::Base
  attr_accessible :category, :description, :image, :name, :price, :sale, :stock_quantity
  
  #associations
  has_many :lineitems
  has_many :orders, :through => :line_items
  belongs_to :category
end
