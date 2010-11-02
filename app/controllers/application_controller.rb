class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :products

  protected
    def find_cart
      @cart = Cart.find(session['cart_id']) unless session['cart_id'].blank?
    end

end
