class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @provinces = Province.all
  end
  
  def create
    # The magic of creation happens here!
    @customer = Customer.new(params[:customer])
    province = Province.find(@customer.province_id)
    
    if @customer.save
      session[:cart].each do |item|
        product = Product.find(item)
        order = Order.create(:status => "new", :customer_id => @customer.id, :gst => province.gst, :hst => province.hst, :pst => province.pst)
        Lineitem.create(:order_id => order.id, :price => product.price, :product_id => product.id, :quantity => 1)
      end
      flash[:message] = "Thank you! Your order has been placed."
      redirect_to root_path
    else
      # Load up the view associated with the new action.
      render :action => :new
    end
  end
end
