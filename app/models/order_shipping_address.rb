class OrderShippingAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :address
  validates :phone_number, format: {with: /\A0[0-9]+\z/ }
  validates :token
  end

  validates :area_id,  numericality: { other_than: 1}

  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, area_id: area_id, city: city,address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end


