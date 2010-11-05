class GroovyCartController < ApplicationController
  before_filter :find_cart

  helper :banners

end
