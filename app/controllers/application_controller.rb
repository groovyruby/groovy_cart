class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :products

  protected
    def find_cart
      unless session['cart_id'].blank?
        @cart = Cart.find(session['cart_id'])
      else
        redirect_to cart_url(:notice=>'groovy_cart.messages.empty_cart')
      end
    end

end
