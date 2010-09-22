module ProductsHelper
  def show_full_price(product)
    if product
      if product.price_promo
        "<span class=\"old_price\">#{number_to_currency(product.price)}</span><span class=\"price_promo\">#{number_to_currency(product.price_promo)}</span>"
      else
        "<span class=\"price\">#{number_to_currency(product.price)}</span>"
      end
    else
      ''
    end
  end
  
  def show_price(product)
    if product
      if product.price_promo
        "<span class=\"price\">#{number_to_currency(product.price_promo)}</span>"
      else
        "<span class=\"price\">#{number_to_currency(product.price)}</span>"
      end
    else
      ''
    end
  end
end
