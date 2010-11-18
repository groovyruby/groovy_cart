class Gateways::PaypalExpressController < PaymentGatewayController
  before_filter :find_order
  def new
    @order.start_payment!
    response = EXPRESS_GATEWAY.setup_purchase(@order.price_in_cents,
      :ip                => request.remote_ip,
      :return_url        => url_for(:action=>'confirm_paypal'),
      :cancel_return_url => root_url,
      :shipping_address   => get_billing_address,
      :address_override  => 1,
      :order_id          => @order.id,
      :email             => @order.addresses.first.email
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def confirm_paypal

    @order.payment_token = params[:token]
    @order.save
  end

  def success
    @order.finish_payment!
    token = @order.payment_token
    token_details = EXPRESS_GATEWAY.details_for(@order.payment_token)
    response = EXPRESS_GATEWAY.purchase(@order.price_in_cents, express_purchase_options(token, token_details))

    t = @order.order_transactions.new(:action => "paypal_express_success", :amount => @order.price_in_cents)

    if response.success?
      @order.paid!
    end
    begin
      t.success       = response.success?
      t.authorization = response.authorization
      t.message       = response.message
      t.params        = response.params
    rescue ActiveMerchant::ActiveMerchantError => e
      t.success       = false
      t.authorization = nil
      t.message       = e.message
      t.params        = {}
    end

    t.save!
    @cart.destroy
  end

  def failure

  end

  private
    def express_purchase_options(token, token_details)
      {
        :ip => @order.client_ip,
        :token => token,
        :payer_id => token_details.payer_id,
        :billing_address => get_billing_address

      }
    end
    def get_billing_address
      {
          :name     => @order.addresses.first.full_name,
          :address1 => @order.addresses.first.street,
          :city     => @order.addresses.first.city,
          :state    => nil,
          :country  => @order.addresses.first.country,
          :zip      => @order.addresses.first.zip_code
        }
    end



end