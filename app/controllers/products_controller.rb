class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    
    unless params[:category_id].blank?
      session['last_category_id'] = Category.find(params[:category_id]).id
    else
      session['last_category_id'] = @product.categories.first if not @product.categories.empty? and session['last_category_id'].blank?
    end
  end

end
