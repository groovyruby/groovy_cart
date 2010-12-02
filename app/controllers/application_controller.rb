class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_cart_for_devise

  helper :products

  protected
    def find_cart
      @cart = Cart.where(:id => session['cart_id']).first unless session['cart_id'].blank?
      create_cart if @cart.blank?
    end
    helper_method :find_cart

    def last_visited_category
      Category.find(session['last_category_id']) unless session['last_category_id'].blank?
    end
    helper_method :last_visited_category

  private
    def find_cart_for_devise
      if devise_controller?
        self.find_cart
      end
    end

    def create_cart
      c = Cart.create!
      session['cart_id'] = c.id
      @cart = c
      c
    end
end
