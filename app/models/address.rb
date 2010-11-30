class Address < ActiveRecord::Base
  belongs_to :order

  validates :first_name, :last_name, :street, :city, :zip_code, :country, :presence => true, :if=>proc{|o| not o.is_shipping? }
  validates :email, :phone, :presence=>true, :if=>proc{|o| not o.is_shipping? }

  
  attr_accessible :first_name, :last_name, :street, :city, :zip_code, :country, :email, :phone, :is_shipping

  after_create :clone_address_data

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
    def clone_address_data
      if self.is_shipping?
        billing = self.order.billing_address
        self.first_name = billing.first_name if self.first_name.blank?
        self.last_name = billing.last_name if self.last_name.blank?
        self.street = billing.street if self.first_name.blank?
        self.city = billing.city if self.city.blank?
        self.zip_code = billing.zip_code if self.zip_code.blank?
        self.country = billing.country if self.country.blank?
        self.save
      end
    end
end
