class Product < ActiveRecord::Base
  attr_accessible :category, :description, :image, :name, :price, :sale, :stock_quantity
end
