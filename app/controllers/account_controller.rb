class AccountController < GroovyCartController
  before_filter :authenticate_customer!

  def index

  end

  def order_history
    @orders = current_customer.orders
  end

  def order_details
    @order = current_customer.orders.find(params[:id])
  end
end
