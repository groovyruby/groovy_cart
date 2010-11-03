class OptionGroup < ActiveRecord::Base

  OPTION_GROUP_TYPES = ['string', 'color']

  has_many :options

  has_and_belongs_to_many :products

  validates :name, :presence=>true
  validates :slug, :presence=>true
  validates :option_group_type, :presence=>true, :inclusion=>{:in=>OptionGroup::OPTION_GROUP_TYPES}

  validates_associated :options

  accepts_nested_attributes_for :options, :allow_destroy=>true, :reject_if=>proc {|o| o['name'].blank?}

  attr_accessible :name, :option_group_type, :options_attributes, :slug
end
