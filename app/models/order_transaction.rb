class OrderTransaction < ActiveRecord::Base
  belongs_to :order
  serialize :params
  
end
