class CartsController < GroovyCartController
  
  def show
  end

  def update
    @cart.update_attributes(params[:cart])
    @cart.recalculate
    @cart.save
    #@cart.destroy if @cart.cart_items.count == 0
    redirect_to cart_url
  end

  def add_product_to
    @cart = Cart.find(@cart.id)
    product = Product.find(params[:product_id])
    product_variation = nil
    product_variation = product.product_variations.find(params[:variation_id]) unless params[:variation_id].blank?
    @cart.add_product(product, product_variation)
    redirect_to cart_url
  end



end
