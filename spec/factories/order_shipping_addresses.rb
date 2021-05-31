FactoryBot.define do
  factory :order_shipping_address do
    post_code { '123-4567' }
    area_id { 2 }
    city { '北海市' }
    address{'1-2'}
    building_name {"あああああ"}
    phone_number {"09012345678"}
    token {'tok_abcdefghijk00000000000000000' }
  end
end
    
  