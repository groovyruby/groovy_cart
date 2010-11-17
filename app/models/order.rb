class Order < ActiveRecord::Base
  include ActiveRecord::Transitions

  belongs_to :shipping_method
  has_one :cart
  has_many :addresses
  has_many :order_items

  validates :total_value, :numericality=>true
  validates :discount_value, :numericality=>true, :presence=>true
  validates :discounted_value, :numericality=>true
  validates :shipping_cost, :numericality=>true, :presence=>true
  validates :items_value, :numericality=>true

  accepts_nested_attributes_for :addresses

  before_save :copy_shipping_cost

  attr_accessible :discount_value, :addresses_attributes

  state_machine do
    state :new
    state :confirmed, :enter=>:clone_cart_items
    state :payment_started
    state :payment_finished
    state :paid

    event :confirm do
      transitions :to => :confirmed, :from => [:new]
    end

    event :start_payment do
      transitions :to => :payment_started, :from=>[:confirmed]
    end

    event :finish_payment do
      transitions :to => :payment_finished, :from=>[:payment_started]
    end

    event :paid do
      transitions :to => :paid, :from=>[:payment_started, :payment_finished]
    end
  end

  def to_s
    self.id.to_s
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

  def copy_shipping_cost
    self.total_value = self.items_value
    self.shipping_cost = self.shipping_method.calculate_for_cart(self) unless self.shipping_method.blank?
    self.total_value += self.shipping_cost
    self.calculate_discount
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
        oi.quantity = ci.quantity
        oi.item_price = ci.item_price
        oi.item_value = oi.quantity * oi.item_price
        oi.save!
      end

    end
  end

end
