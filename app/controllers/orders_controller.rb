class OrdersController < GroovyCartController
  before_filter :check_cart_order, :only=>[:new, :create]
  before_filter :find_order, :except=>[:new, :create]
  def new
    @order = Order.new
    a = @order.addresses.new
    @order.addresses << a
    a = @order.addresses.new
    a.is_shipping = true
    @order.addresses << a
  end

  def create
    @order = Order.new(params[:order])
    @cart.order = @order
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
    @order.confirm!
    @order.payment_gateway = PaymentGateway.find(params[:payment_gateway_id])
    @order.apply_payment_cost
    @order.client_ip = request.remote_ip
    @order.save
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
    end


end
