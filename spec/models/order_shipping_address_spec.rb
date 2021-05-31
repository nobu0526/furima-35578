require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.1
    
  end

   context "内容に問題がない場合" do
     it "全て正常" do
      expect(@order_shipping_address.valid?).to eq true
     end
    

    it"建物の名前がなくでも登録できる" do
      @order_shipping_address.building_name = ""
      expect(@order_shipping_address.valid?).to eq true
    end
  end

  describe "商品購入" do

    it "item_idがなければ登録できない" do
      @order_shipping_address.item_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Item can't be blank"
    end

    it "user_idがなければ登録できない" do
      @order_shipping_address.user_id = nil
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"User can't be blank"
    end

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

    it "郵便番号はハイフンなしでは登録できない" do
      @order_shipping_address.post_code = 1234567
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

    it "電話番号は英数登録できない" do
      @order_shipping_address.phone_number = "a1a1a1a1a1a"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include"Phone number is invalid"
    end

    it "電話番号は12桁以上は登録できない" do
      @order_shipping_address.phone_number = "090123456789"
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




