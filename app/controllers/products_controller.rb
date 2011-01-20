class ProductsController < GroovyCartController
  
  def index
    params[:search] ||= {}
    params[:search][:meta_sort] ||= 'created_at.desc'
    @search = Product.search(params[:search])
    @products = @search.paginate(:page => params[:page])
  end

  def show
    @product = Product.includes(:properties=>[:property_type]).find(params[:id])
    @option_groups = @product.option_groups
    unless params[:category_id].blank?
      session['last_category_id'] = Category.find(params[:category_id]).id
    else
      if not @product.categories.empty? and (session['last_category_id'].blank? or not @product.categories.all.map{|c| c.id}.member?(session['last_category_id']))
        session['last_category_id'] = @product.categories.first
      end
    end
  end

end
