class PaymentGatewayController < GroovyCartController
  def success
  end

  def failure
  end

  protected
    def find_order
      @order = @cart.order
      redirect_to(root_url) unless @order
    end

end
