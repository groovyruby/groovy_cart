class Gateways::CodController < PaymentGatewayController
  before_filter :find_order
  def new
    @order.start_payment!
    @order.paid!
    redirect_to :action=>"success"
  end

  def success
    @cart.destroy
  end

  def failure
  end

end
