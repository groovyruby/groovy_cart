class CartsController < ApplicationController
  before_filter :create_cart
  before_filter :find_cart
  def show
  end

  def add_product
    product = Product.find(params[:product_id])
    product_variation = nil
    product_variation = ProductVariation.find(params[:variation_id])

  end

  private
    def create_cart
      if session['cart_id'].blank?
        c = Cart.create!
        session['cart_id'] = c.id
      end
    end

end
