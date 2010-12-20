class Order < ActiveRecord::Base
  include ActiveRecord::Transitions

  scope :ordered, order('created_at DESC')

  belongs_to :payment_gateway
  belongs_to :shipping_method
  belongs_to :customer
  has_one :cart
  has_many :addresses
  has_many :order_items
  has_many :order_transactions

  validates :total_value, :numericality=>true
  validates :discount_value, :numericality=>true, :presence=>true
  validates :discounted_value, :numericality=>true
  validates :shipping_cost, :numericality=>true, :presence=>true
  validates :items_value, :numericality=>true

  accepts_nested_attributes_for :addresses

  #before_save :copy_shipping_cost

  attr_accessible :discount_value, :addresses_attributes, :first_name, :last_name

  state_machine do
    state :new
    state :confirmed
    state :payment_started
    state :payment_finished
    state :paid
    state :sent
    state :completed
    state :canceled

    event :confirm do
      transitions :to => :confirmed, :from => [:new], :on_transition => :make_confirmed
    end

    event :start_payment do
      transitions :to => :payment_started, :from=>[:confirmed]
    end

    event :finish_payment do
      transitions :to => :payment_finished, :from=>[:payment_started]
    end

    event :paid do
      transitions :to => :paid, :from=>[:payment_started, :payment_finished], :on_transition => :mail_paid
    end

    event :send_order do
      transitions :to => :sent, :from=>[:new, :confirmed, :paid]
    end

    event :mark_completed do
      transitions :to => :completed, :from=>[:new, :confirmed, :payment_started, :payment_finished, :paid, :sent]
    end

    event :cancel do
      transitions :to => :canceled, :from=>[:new, :confirmed, :payment_started, :payment_finished, :paid, :sent]
    end
  end

  def to_s
    self.id.to_s
  end

  def price_in_cents
    (self.total_value*100).round
  end

  def get_items_count
    ret = 0
    if not self.order_items.empty?
      self.order_items.each {|ci| ret += ci.quantity}
    elsif not self.cart.blank?
      ret = self.cart.get_items_count
    end
    ret
  end

  def copy_values(save_self=false)
    unless self.cart.blank?
      self.total_value = self.cart.total_value
      self.items_value = self.cart.items_value
      self.shipping_method = self.cart.shipping_method
      self.calculate_discount
      self.save if save_self
    end
  end

  def apply_all_payments
    self.total_value = self.items_value
    self.shipping_cost = 0.0
    self.payment_cost = 0.0
    self.discount_value = 0.0
    self.copy_shipping_cost
    self.apply_payment_cost
    self.calculate_discount
  end

  def copy_shipping_cost
    self.total_value -= self.shipping_cost
    self.shipping_cost = self.shipping_method.calculate_for_cart(self) unless self.shipping_method.blank?
    self.total_value += self.shipping_cost

  end

  def apply_payment_cost(save_self=true)
    self.total_value -= self.payment_cost
    self.payment_cost = self.payment_gateway.calculate_for_order_value(self) unless self.payment_gateway.blank?
    self.total_value += self.payment_cost
    self.save if save_self
  end

  def calculate_discount
    self.discounted_value = self.total_value - self.discount_value
  end


  def clone_cart_items
    unless self.cart.blank?
      self.copy_values
      for ci in self.cart.cart_items
        oi = self.order_items.new
        oi.product = ci.product
        oi.product_variation = ci.product_variation
        oi.name = oi.product_variation.blank? ? oi.product.name : oi.product_variation.name
        oi.sku = oi.product_variation.blank? ? oi.product.sku : oi.product_variation.sku
        oi.quantity = ci.quantity
        oi.item_price = ci.item_price
        oi.item_value = oi.quantity * oi.item_price
        oi.save!
      end

    end
  end

  def billing_address
    self.addresses.where('is_shipping=?', false).first
  end

  def shipping_address
    self.addresses.where('is_shipping=?', true).first
  end
  
  def cache_address_data
    self.first_name = self.billing_address.first_name
    self.last_name = self.billing_address.last_name
    self.save
  end

  def mail_confirmed
    self.cache_address_data
    OrderMailer.completed(self).deliver
  end

  def mail_paid
    OrderMailer.paid(self).deliver
  end

  def make_confirmed
    mail_confirmed
    clone_address_data
  end

  def clone_address_data
    self.addresses.each {|a| a.clone_address_data }
  end
end
