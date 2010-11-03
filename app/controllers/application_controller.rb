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

    def last_visited_category
      Category.find(session['last_category_id']) unless session['last_category_id'].blank?
    end

    helper_method :last_visited_category

end
