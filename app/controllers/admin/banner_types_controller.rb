class Admin::BannerTypesController < AdminController
  # GET /banner_types
  # GET /banner_types.xml
  def index
    @banner_types = BannerType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banner_types }
    end
  end

  # GET /banner_types/1
  # GET /banner_types/1.xml
  def show
    @banner_type = BannerType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner_type }
    end
  end

  # GET /banner_types/new
  # GET /banner_types/new.xml
  def new
    @banner_type = BannerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner_type }
    end
  end

  # GET /banner_types/1/edit
  def edit
    @banner_type = BannerType.find(params[:id])
  end

  # POST /banner_types
  # POST /banner_types.xml
  def create
    @banner_type = BannerType.new(params[:banner_type])

    respond_to do |format|
      if @banner_type.save
        format.html { redirect_to([:admin, @banner_type], :notice => 'Banner type was successfully created.') }
        format.xml  { render :xml => @banner_type, :status => :created, :location => @banner_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /banner_types/1
  # PUT /banner_types/1.xml
  def update
    @banner_type = BannerType.find(params[:id])

    respond_to do |format|
      if @banner_type.update_attributes(params[:banner_type])
        format.html { redirect_to([:admin, @banner_type], :notice => 'Banner type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /banner_types/1
  # DELETE /banner_types/1.xml
  def destroy
    @banner_type = BannerType.find(params[:id])
    @banner_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_banner_types_url) }
      format.xml  { head :ok }
    end
  end
end
