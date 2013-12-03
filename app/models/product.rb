class Product < ActiveRecord::Base
  attr_accessible :category, :description, :image, :name, :price, :sale, :stock_quantity
  
  #associations
  has_many :lineitems
  has_many :orders, :through => :lineitems
  belongs_to :category
end
