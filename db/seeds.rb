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

if Setting.get('product.cart_image_dimensions').blank?
  s = Setting.create({:value=>"80x80>"})
  s.identifier = 'product.cart_image_dimensions'
  s.label = 'product.cart_image_dimensions'
  s.field_type = 'string'
  s.save
end

if Setting.get('general.default_from_address').blank?
  s = Setting.create({:value=>"groovycart@groovyru.by"})
  s.identifier = 'general.default_from_address'
  s.label = 'general.default_from_address'
  s.field_type = 'string'
  s.save
end

if Setting.get('integrations.use_mailchimp').blank?
  s = Setting.create({:value=>"f"})
  s.identifier = 'integrations.use_mailchimp'
  s.label = 'Use mailchimp.com?'
  s.description = 'System can automagically add all new customer to mailchimp list'
  s.field_type = 'boolean'
  s.save
end

if Setting.get('integrations.mailchimp_api_key').blank?
  s = Setting.create({:value=>""})
  s.identifier = 'integrations.mailchimp_api_key'
  s.label = 'Mailchimp.com API key'
  s.description = 'Can be found through Maichimp -> account -> API Keys And Info'
  s.field_type = 'string'
  s.save
end

if Setting.get('integrations.mailchimp_unique_id').blank?
  s = Setting.create({:value=>""})
  s.identifier = 'integrations.mailchimp_unique_id'
  s.label = 'Mailchimp.com list unique_id'
  s.description = 'Unique_id can be found on list settings page'
  s.field_type = 'string'
  s.save
end

if Setting.get('integrations.use_google_analytics').blank?
  s = Setting.create({:value=>"f"})
  s.identifier = 'integrations.use_google_analytics'
  s.label = 'Use Google Analytics(tm)?'
  s.description = 'System will automatically install tracking code'
  s.field_type = 'boolean'
  s.save
end

if Setting.get('integrations.google_analytics_tracking_id').blank?
  s = Setting.create({:value=>""})
  s.identifier = 'integrations.google_analytics_tracking_id'
  s.label = 'Google Analytics(tm) tracking ID'
  s.description = 'ID of site to be tracked using google analytics'
  s.field_type = 'string'
  s.save
end

if PaymentGateway.where('class_name=?', 'cod').blank?
  pg = PaymentGateway.new
  pg.name = 'Cash on delivery'
  pg.class_name = 'cod'
  pg.is_active = true
  pg.save
end

if PaymentGateway.where('class_name=?', 'cod').first.blank?
  pg = PaymentGateway.new
  pg.name = 'Cash on delivery'
  pg.class_name = 'cod'
  pg.is_active = true
  pg.save
end

if PaymentGateway.where('class_name=?', 'paypal_express').first.blank?
  pg = PaymentGateway.new
  pg.name = 'Paypal express'
  pg.class_name = 'paypal_express'
  pg.is_active = true
  pg.additional_percentage_fee = '2.3'
  pg.save
end
