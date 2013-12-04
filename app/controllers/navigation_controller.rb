class NavigationController < ApplicationController
  before_filter :get_session
  
  def index
    @products = Product.order("id").page(params[:page]).per(6)
  end
  
  def about
    @page = Page.first
    @title = @page.about_title
    @content = @page.about_content
  end
  
  def contact
    @page = Page.first
    @title = @page.contact_title
    @content = @page.contact_content
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def search_results
    if params[:category] == "0"
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%").page(params[:page]).per(6)
    else
      @products = Product.where(:category_id => params[:category]).where("name LIKE ? OR description LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%").page(params[:page]).per(6)
    end
    get_session
  end
  
  def category
    @products = Product.where(:category_id => params[:id]).page(params[:page]).per(6)
  end
  
  def add_to_cart
    id = params[:id].to_i
    session[:cart] ||= [] #default to empty array
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to :action => :index
  end
  
  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to :action => :index
  end
  
  def get_session
    if session[:cart].nil? == false
      @shopping_cart_items = []
      session[:cart].each do |item|
        @shopping_cart_items << Product.find(item)
      end
    else
      session[:cart] = []
      @shopping_cart_items = []
    end
  end
  
  def checkout
    id = params[:id].to_i
    session[:cart] = []
    session[:cart] << id
    redirect_to new_customer_path
  end
end
