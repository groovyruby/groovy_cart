Factory.define :product do |p|
  p.name "test product"
  p.price 100
end

Factory.define :cart do
end

Factory.define :option_group do |og|
  og.name "colors"
  og.option_group_type OptionGroup::OPTION_GROUP_TYPES.first
end

Factory.define :complex_product, :parent=>:product do |cp|
  cp.name "complex product"
  cp.option_groups{|og| [og.association(:option_group)]}
end


Factory.define :option do |o|
  o.name "red"
  o.association :option_group, :factory=>:option_group
end

Factory.define :product_variation do |pv|
  pv.price 120
  pv.association :product, :factory=>:complex_product
  pv.options{|o| [o.association(:option)]}
end