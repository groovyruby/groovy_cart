class Admin::OptionGroupsController < AdminController
  # GET /option_groups
  # GET /option_groups.xml
  def index
    @option_groups = OptionGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @option_groups }
    end
  end

  # GET /option_groups/1
  # GET /option_groups/1.xml
  def show
    @option_group = OptionGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @option_group }
    end
  end

  # GET /option_groups/new
  # GET /option_groups/new.xml
  def new
    @option_group = OptionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @option_group }
    end
  end

  # GET /option_groups/1/edit
  def edit
    @option_group = OptionGroup.find(params[:id])
  end

  # POST /option_groups
  # POST /option_groups.xml
  def create
    @option_group = OptionGroup.new(params[:option_group])

    respond_to do |format|
      if @option_group.save
        format.html { redirect_to([:admin, @option_group], :notice => 'Option group was successfully created.') }
        format.xml  { render :xml => @option_group, :status => :created, :location => @option_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @option_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /option_groups/1
  # PUT /option_groups/1.xml
  def update
    @option_group = OptionGroup.find(params[:id])

    respond_to do |format|
      if @option_group.update_attributes(params[:option_group])
        format.html { redirect_to([:admin, @option_group], :notice => 'Option group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @option_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /option_groups/1
  # DELETE /option_groups/1.xml
  def destroy
    @option_group = OptionGroup.find(params[:id])
    @option_group.destroy

    respond_to do |format|
      format.html { redirect_to(admin_option_groups_url) }
      format.xml  { head :ok }
    end
  end
end
