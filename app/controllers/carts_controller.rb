class CartsController < ApplicationController
  before_filter :find_cart
  
  def show
  end

  def add_product
    product = Product.find(params[:product_id])
    product_variation = nil
    product_variation = product.product_variations.find(params[:variation_id]) unless params[:variation_id].blank?
    @cart.add_product(product, product_variation)
    redirect_to cart_url
  end



end
