class Admin::BannerPlacementsController < AdminController
  # GET /banner_placements
  # GET /banner_placements.xml
  def index
    @banner_placements = BannerPlacement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banner_placements }
    end
  end

  # GET /banner_placements/1
  # GET /banner_placements/1.xml
  def show
    @banner_placement = BannerPlacement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner_placement }
    end
  end

  # GET /banner_placements/new
  # GET /banner_placements/new.xml
  def new
    @banner_placement = BannerPlacement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner_placement }
    end
  end

  # GET /banner_placements/1/edit
  def edit
    @banner_placement = BannerPlacement.find(params[:id])
  end

  # POST /banner_placements
  # POST /banner_placements.xml
  def create
    @banner_placement = BannerPlacement.new(params[:banner_placement])

    respond_to do |format|
      if @banner_placement.save
        format.html { redirect_to([:admin, @banner_placement], :notice => 'Banner placement was successfully created.') }
        format.xml  { render :xml => @banner_placement, :status => :created, :location => @banner_placement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner_placement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /banner_placements/1
  # PUT /banner_placements/1.xml
  def update
    @banner_placement = BannerPlacement.find(params[:id])

    respond_to do |format|
      if @banner_placement.update_attributes(params[:banner_placement])
        format.html { redirect_to([:admin, @banner_placement], :notice => 'Banner placement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner_placement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /banner_placements/1
  # DELETE /banner_placements/1.xml
  def destroy
    @banner_placement = BannerPlacement.find(params[:id])
    @banner_placement.destroy

    respond_to do |format|
      format.html { redirect_to(admin_banner_placements_url) }
      format.xml  { head :ok }
    end
  end
end
