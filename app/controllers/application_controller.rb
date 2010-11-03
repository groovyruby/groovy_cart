class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :products

  protected
    def find_cart
      unless session['cart_id'].blank?
        @cart = Cart.find(session['cart_id'])
      else
        create_cart
      end
    end
    helper_method :find_cart

    def last_visited_category
      Category.find(session['last_category_id']) unless session['last_category_id'].blank?
    end
    helper_method :last_visited_category

  private
    def create_cart
      if session['cart_id'].blank?
        c = Cart.create!
        session['cart_id'] = c.id
        c
      end
    end
end
