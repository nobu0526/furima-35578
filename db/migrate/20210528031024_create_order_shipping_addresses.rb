class CreateOrderShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_shipping_addresses do |t|

      t.timestamps
    end
  end
end
