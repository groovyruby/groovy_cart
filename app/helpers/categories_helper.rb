module CategoriesHelper
  def format_cat_name(c)
    '-'*c.ancestry_depth+c.name
  end

  def categories_option_tree
    get_children(Category.roots)
  end

  def get_children(cats)
    ret = []
    for c in cats
      ret << [format_cat_name(c), c.id]
      ret |= get_children(c.children)
    end
    ret
  end
end
