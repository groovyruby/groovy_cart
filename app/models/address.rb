class Address < ActiveRecord::Base
  
  belongs_to :customer
  belongs_to :order

  validates :first_name, :last_name, :street, :city, :zip_code, :country, :presence => true, :if=>proc{|o| not o.is_shipping? }
  validates :phone, :presence=>true, :if=>proc{|o| not o.is_shipping? }
  validates :email, :presence=>true, :if=>proc{|o|
    not o.is_shipping? and not o.is_personal_address? 
  }

  
  attr_accessible :first_name, :last_name, :street, :city, :zip_code, :country, :email, :phone, :is_shipping, :is_personal_address

  after_create :clone_address_data
  before_create :assign_to_customer
  before_save :fill_in_email

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
    def clone_address_data
      if self.is_shipping? and not self.order.blank?
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

  def assign_to_customer
    unless self.order.blank?
      self.customer_id = self.order.customer_id
    end
  end

  def fill_in_email
    self.email = self.customer.email unless self.customer.blank?
  end
end
