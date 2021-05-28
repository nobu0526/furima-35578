class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :area

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

end
  
