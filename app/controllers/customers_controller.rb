class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @provinces = Province.all
  end
end
