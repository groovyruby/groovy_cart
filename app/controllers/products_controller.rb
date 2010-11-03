class ProductsController < GroovyCartController
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    
    unless params[:category_id].blank?
      session['last_category_id'] = Category.find(params[:category_id]).id
    else
      if not @product.categories.empty? and (session['last_category_id'].blank? or not @product.categories.all.map{|c| c.id}.member?(session['last_category_id']))
        session['last_category_id'] = @product.categories.first
      end
    end
  end

end
