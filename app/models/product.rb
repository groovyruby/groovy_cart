class Product < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true

  belongs_to :brand
  belongs_to :product_type
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :option_groups
  has_many :cart_items
  has_many :photos
  has_many :product_variations
  has_many :properties
  has_many :property_types, :through=>:properties

  validates :name, :presence=>true
  validates :price, :numericality=>{:greater_than_or_equal_to=>0}, :presence=>true
  validates :price_promo, :numericality=>{:greater_than_or_equal_to=>0, :allow_nil=>true}


  validates_associated :product_variations
  
  accepts_nested_attributes_for :photos, :allow_destroy=>true, :reject_if=>proc{|p| p['photo'].blank?}
  accepts_nested_attributes_for :product_variations, :allow_destroy=>true, :reject_if=>proc{|pv| pv['price'].blank? }
  accepts_nested_attributes_for :properties
  attr_accessible :name, :description, :brand_id, :category_ids, :price, :price_promo, :product_variations_attributes,
                  :option_group_ids, :properties_attributes, :photos_attributes, :sku, :product_type_id

  before_save :fill_in_sku
  after_update :clean_up_options_mess

  def get_price
    if not self.price_promo.blank? and self.price_promo>0
      self.price_promo
    else
      self.price
    end
  end

  def fill_in_sku
    self.sku = self.name.parameterize if self.sku.blank?
  end

  def get_options(identifier)
    self.option_groups.where('slug=?', identifier).first
  end

  def get_photo
    self.photos.first || self.photos.build
  end

  def options
    self.option_groups.map{|og| og.options.all }.flatten
  end

  def variation_available_for_option(option)
    not self.product_variations.joins(:options).where('product_variations.price > ?', 0).where('options.id=?', option.id).first.blank?
  end

  def clean_up_options_mess
    # Delete options (for variations) from non-existing groups
    for pv in self.product_variations.all
      for o in pv.options.all
        pv.options.delete(o) unless self.option_groups.member?(o.option_group)
      end
    end

    # delete option from photos for non-existing groups
    for p in self.photos.all
      p.option = nil unless self.option_groups.member?(p.option.option_group)
    end if false

    # create new options for variations (if needed)
    for pv in self.product_variations.all
      if pv.options.count != self.option_groups.count
        og_ids = pv.options.all.map{|o| o.option_group_id}.uniq
        for og in self.option_groups.where('option_groups.id not in (?)', og_ids)
          pv.options << og.options.first
        end
      end
    end
  end

  def get_property(identifier)
    self.properties.joins(:property_type).where('property_types.identifier=?', identifier).first
  end

  def assign_properties
    unless self.product_type.blank?
      for pt in (self.product_type.property_types - self.property_types)
        p = pt.properties.new
        p.property_type = pt
        self.properties << p
      end

      for pt in (self.property_types - self.product_type.property_types)
        self.properties.where('property_type_id=?', pt.id).first.destroy
      end
      
    end
  end
end
