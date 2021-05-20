class Item < ApplicationRecord
  with_options presencs:true, numericality: { other_than: 1 } do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :stasus_id
    validates :charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  belongs_to:user
end

