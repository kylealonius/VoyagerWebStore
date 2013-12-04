class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :sale, :stock_quantity, :category_id
  
  #associations
  has_many :lineitems
  has_many :orders, :through => :lineitems
  belongs_to :category
  
  validates :description, :image, :name, :price, :sale, :stock_quantity, :category_id, presence: true
end
