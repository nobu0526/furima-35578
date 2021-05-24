class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image

  with_options presence:true do
    validates :name
    validates :description
    validates :price
    validates :image
    

    with_options numericality: { other_than: 1} do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    end
  end


  
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :chrage
  belongs_to :shipping_area
  belongs_to :shipping_day
end

