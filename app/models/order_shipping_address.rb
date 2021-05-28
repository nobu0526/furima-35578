class OrderShippingAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :item_id :user_id

  with_options presence: true do
  validates: post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates: area_id,  numericality: { other_than: 0}
  validates: city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates: address
  validates: phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
  end

  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    shipping_address.create(post_code: post_code, area_id: area_id, city: city,address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
  
end


