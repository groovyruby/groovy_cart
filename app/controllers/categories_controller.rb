class CategoriesController < GroovyCartController
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @child_categories = @category.children.all
    descentants= @category.descendants.all
    cat_ids = descentants.map{|c| c.id} || []
    cat_ids << @category.id
    session['last_category_id'] = @category.id
    @products = Product.joins(:categories).where('categories.id' => cat_ids)
    @brands = Brand.all
    unless params[:brand].blank?
      @brand = Brand.find(params[:brand])
      @products = @products.where('brand_id=?', @brand.id)
    end
  end

end
