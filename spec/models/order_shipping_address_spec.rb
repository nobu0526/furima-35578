require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @order_shipping_address = FactoryBot.build(:order_shipping_address)
  end

   context "内容に問題がない場合" do
     it "全て正常" do
      expect(@order_shipping_address.valid?).to eq true
     end
    end

  describe "商品購入" do

    it "郵便番号は空白では登録できない" do
      @order_shipping_address.post_code = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Post code can't be blank"
    end

    it "郵便番号は前３桁後４桁以外は登録できない" do
      @order_shipping_address.post_code = 1234-123
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Post code is invalid"
    end

    it "郵便番号は半角英字では登録できない" do
      @order_shipping_address.post_code = "aaa-aaaa"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Post code is invalid"
    end

    

    it "都道府県は空白では登録できない" do
      @order_shipping_address.area_id = 1
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Area must be other than 1"
    end

    it "市町村区は空白では登録できない" do
      @order_shipping_address.city = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"City can't be blank"
    end

    it "番地は空白では登録できない" do
      @order_shipping_address.address = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Address can't be blank"
    end

    it "電話番号は空白では登録できない" do
      @order_shipping_address.phone_number = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Phone number can't be blank"
    end

    it "電話番号は半角英字登録できない" do
      @order_shipping_address.phone_number = "aaaaaaaaaa"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Phone number is invalid"
    end

    it "クレジットカード情報は空白では登録できない" do
      @order_shipping_address.token = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Token can't be blank"
    end
  end
end




