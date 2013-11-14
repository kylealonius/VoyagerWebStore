class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst, :hst, :pst, :status
end
