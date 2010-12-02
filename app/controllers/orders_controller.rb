class OrdersController < GroovyCartController
  before_filter :check_cart_order, :only=>[:new, :create]
  before_filter :find_order, :except=>[:new, :create]
  def new
    session.delete :customer_return_to
    
    @order = Order.new
    if customer_signed_in? and not current_customer.addresses.empty?
      addr = current_customer.addresses.first
      a = @order.addresses.new
      a.first_name = addr.first_name
      a.last_name = addr.last_name
      a.street = addr.street
      a.zip_code = addr.zip_code
      a.city = addr.city
      a.country = addr.country
      a.phone = addr.phone
      a.email = addr.email
    else
      a = @order.addresses.new
    end
    @order.addresses << a
    a = @order.addresses.new
    a.is_shipping = true
    @order.addresses << a
  end

  def create
    @order = Order.new(params[:order])
    @cart.order = @order
    @order.customer = current_customer
    if @order.save
      @cart.save
      redirect_to order_url
    else
      render :action=>"new"
    end
  end

  def edit

  end

  def update
    @order = @cart.order
    if @order.update_attributes(params[:order])
      redirect_to order_url
    else
      render :action=>"edit"
    end
  end

  def show
  end

  def confirm
    @order.payment_gateway = PaymentGateway.find(params[:payment_gateway_id])
    @order.save
    @order.clone_cart_items
    @order.apply_all_payments
    @order.client_ip = request.remote_ip
    @order.save
    @order.confirm!
    # TODO: redirect to chosen payments gateway
    redirect_to url_for(:controller=>"/gateways/#{@order.payment_gateway.class_name}", :action=>"new")
  end

  def confirmed
  end

  private
  def check_cart_order
    redirect_to(edit_order_url) unless @cart.order.blank?
  end

    def find_order
      @order = @cart.order
      redirect_to cart_url(:warning=>'Cart was empty, please contact us') if @order.blank?
      redirect_to order_url if not @order.blank? and not @order.new_record?
    end


end
