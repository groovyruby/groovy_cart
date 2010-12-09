class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :addresses, :conditions=>['addresses.is_personal_address = ?', true]
  has_many :all_addresses, :class_name=>'Address'
  has_many :orders
  has_many :surveys
  
  validates_associated :addresses
  
  accepts_nested_attributes_for :addresses
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :addresses_attributes

  before_save :propagate_email
  
  def full_name
    unless self.addresses.empty?
      a = self.addresses.first
      "#{a.last_name}, #{a.first_name}"
    else
      self.email
    end
  end
  
  private
  def propagate_email
    self.addresses.first.email = self.email if not self.addresses.empty? and self.addresses.first.email != self.email 
  end
end
