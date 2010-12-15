require 'mime/types'

class Admin::ProductsController < AdminController
  # GET /products
  # GET /products.xml
  def index
    @search = Product.search(params[:search])
    #@products = @search.all   # load all matching records
    @products = @search.paginate(:page => params[:page]) # Who doesn't love will_paginate

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    session[:plupload_product_temp_id] = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}/"))[0..7]
    @product = Product.new
    unless params[:product_type].blank?
      @product_type = ProductType.find(params[:product_type])
      @product.product_type = @product_type
      @product.assign_properties
    end
    @product.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        Photo.update_all(['product_id=?, temp_product_id=?', @product.id, nil], ['temp_product_id=?', session[:plupload_product_temp_id] || '-1'])
        session[:plupload_product_temp_id] = nil
        format.html { redirect_to(params[:return].blank? ? [:admin, @product] : edit_admin_product_path(@product), :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(params[:return].blank? ? [:admin, @product] : edit_admin_product_path(@product), :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_photo
    @photo = Photo.new(params[:photo])
    @photo.photo = params[:file] if params.has_key?(:file)
    # detect Mime-Type (mime-type detection doesn't work in flash)
    @photo.photo_content_type = MIME::Types.type_for(params[:name]).to_s if params.has_key?(:name)
    @photo.temp_product_id = session[:plupload_product_temp_id] unless session[:plupload_product_temp_id].blank?
    @photo.product = Product.find(params[:product_id]) unless params[:product_id].blank?
    @photo.save!

    render :layout => false
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(admin_products_url) }
      format.xml  { head :ok }
    end
  end
end
