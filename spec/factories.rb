Factory.define :product do |p|
  p.name "test product"
  p.price 100
end

Factory.define :cart do
end

Factory.define :option_group do |og|
  og.name "colors"
  og.slug "colors"
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

Factory.define :banner_type do |bt|
  bt.name "sample"
  bt.height 100
  bt.width 100
end

Factory.define :banner_placement do |bp|
  bp.name "sample"
  bp.identifier "sample"
end

Factory.define :banner do |b|
  b.name "sample"
  b.association :banner_placement, :factory=>:banner_placement
  b.association :banner_type, :factory=>:banner_type
  b.target_url "http://groovyru.by/"
  b.banner { fixture_file_upload('public/images/rails.png', 'images/png') }
  b.is_active true
end

Factory.define :customer do |f|
  f.sequence(:email) {|n| "person#{n}@example.com" }
  f.password "zxcvbnm"
  f.password_confirmation "zxcvbnm"
end

Factory.define :survey_model do |f|
  f.name "survey_model"
  f.is_active true
  f.active_from_date Time.now-1.day
  f.active_until_date Time.now+1.day
end

Factory.define :survey_question_1, :class=>"survey_question" do |f|
  f.question "question"
  f.field_type "string"
end

Factory.define :survey_question_2, :class=>"survey_question" do |f|
  f.question "question"
  f.field_type "string"
end
