# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if Setting.get('product.list_image_dimensions').blank?
  s = Setting.create({:value=>"100x100>"})
  s.identifier = 'product.list_image_dimensions'
  s.label = 'product.list_image_dimensions'
  s.field_type = 'string'
  s.save
end

if Setting.get('product.show_image_dimensions').blank?
  s = Setting.create({:value=>"300x300>"})
  s.identifier = 'product.show_image_dimensions'
  s.label = 'product.show_image_dimensions'
  s.field_type = 'string'
  s.save
end

