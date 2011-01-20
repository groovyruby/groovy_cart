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
  
  def categories_reorder
    content_tag(:ol, categories_li_tree(Category.by_position.roots), :class=>"sortable")
  end
  
  def categories_li_tree(cats)
    ret = ''
    for c in cats
      ret += %Q{<li id="item_#{c.id}"><div>#{c.name}</div>}
      ret += content_tag(:ol, categories_li_tree(c.children.by_position)) unless c.children.empty?
      ret += %Q{</li>}
    end
    raw(ret)
  end
end
