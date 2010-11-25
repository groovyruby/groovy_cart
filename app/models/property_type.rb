class PropertyType < ActiveRecord::Base

  FIELD_TYPES = %w( string text select checkbox image file )

  belongs_to :product_type

  has_many :properties, :dependent=>:destroy

  validates :name, :presence=>true
  validates :field_type, :inclusion=>{:in=>PropertyType::FIELD_TYPES}
  validates :field_options, :presence=>true, :if=>proc{|f| f['field_type']=='image' }

  before_save :fill_in_identifier


  def fill_in_identifier
    self.identifier = self.name.parameterize if self.identifier.blank?
  end

end
