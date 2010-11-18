class Admin::PaymentGatewaysController < AdminController
  # GET /payment_gateways
  # GET /payment_gateways.xml
  def index
    @payment_gateways = PaymentGateway.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_gateways }
    end
  end

  # GET /payment_gateways/1
  # GET /payment_gateways/1.xml
  def show
    @payment_gateway = PaymentGateway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_gateway }
    end
  end

  # GET /payment_gateways/new
  # GET /payment_gateways/new.xml
  def new
    @payment_gateway = PaymentGateway.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_gateway }
    end
  end

  # GET /payment_gateways/1/edit
  def edit
    @payment_gateway = PaymentGateway.find(params[:id])
  end

  # POST /payment_gateways
  # POST /payment_gateways.xml
  def create
    @payment_gateway = PaymentGateway.new(params[:payment_gateway])

    respond_to do |format|
      if @payment_gateway.save
        format.html { redirect_to([:admin, @payment_gateway], :notice => 'Payment gateway was successfully created.') }
        format.xml  { render :xml => @payment_gateway, :status => :created, :location => @payment_gateway }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_gateway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_gateways/1
  # PUT /payment_gateways/1.xml
  def update
    @payment_gateway = PaymentGateway.find(params[:id])

    respond_to do |format|
      if @payment_gateway.update_attributes(params[:payment_gateway])
        format.html { redirect_to([:admin, @payment_gateway], :notice => 'Payment gateway was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_gateway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_gateways/1
  # DELETE /payment_gateways/1.xml
  def destroy
    @payment_gateway = PaymentGateway.find(params[:id])
    @payment_gateway.destroy

    respond_to do |format|
      format.html { redirect_to(admin_payment_gateways_url) }
      format.xml  { head :ok }
    end
  end
end
