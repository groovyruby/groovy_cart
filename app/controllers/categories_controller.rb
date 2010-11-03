class CategoriesController < GroovyCartController
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    session['last_category_id'] = @category.id
    @products = @category.products
  end

end
