class Category < ActiveRecord::Base
  attr_accessible :name
  
  #association
  has_many :products
end
