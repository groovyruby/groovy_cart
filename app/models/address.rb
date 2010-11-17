class Address < ActiveRecord::Base
  belongs_to :order

  validates :first_name, :last_name, :street, :city, :zip_code, :country, :presence => true
  validates :email, :phone, :presence=>true, :if=>proc{|o| not o.is_shipping? }

  
  attr_accessible :first_name, :last_name, :street, :city, :zip_code, :country, :email, :phone, :is_shipping
end
