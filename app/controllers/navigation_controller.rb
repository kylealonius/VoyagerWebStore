class NavigationController < ApplicationController
  def index
    @products = Product.all
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
      @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
      @products += Product.where("description LIKE ?", "%#{params[:keywords]}%")
    else
      @products = Product.where(:category_id => params[:category]).where("name LIKE ?", "%#{params[:keywords]}%")
      @products += Product.where(:category_id => params[:category]).where("description LIKE ?", "%#{params[:keywords]}%")
    end
  end
  
  def category
    @products = Product.where(:category_id => params[:id])
  end
end
