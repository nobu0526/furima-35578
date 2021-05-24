require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context "内容に問題がない場合" do
    it "全て正常" do
     expect(@item.valid?).to eq true
    end
   end

   describe "商品出品" do

    it "商品の画像を投稿しないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include"Image can't be blank"
    end

      it "商品の名前を投稿しないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include"Name can't be blank"
      end

     
      it "商品説明を投稿しないと出品できない" do
         @item.description = ""
         @item.valid?
         expect(@item.errors.full_messages).to include"Description can't be blank"
      end

       
      it "商品値段を投稿しないと出品できない" do
         @item.price = ""
         @item.valid?
         expect(@item.errors.full_messages).to include"Price can't be blank"
      end

      it "商品の値段が全角だと出品できない" do
         @item.price ="１０００" 
         @item.valid?
         expect(@item.errors.full_messages).to include"Price is not a number"
      end

     it "商品の値段が300未満だと出品できない" do
        @item.price =299 
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
     end

     it "商品の値段が10,000,000以上だと出品できない" do
        @item.price =10000000
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
     end

     it "商品カテゴリーを選択しないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Category must be other than 1"
     end

    it "商品ステータスを選択しないと出品できない" do
       @item.status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include"Status must be other than 1"
    end

    it "配送料の負担を選択しないと出品できない" do
       @item.charge_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include"Charge must be other than 1"
    end

   it "発送元の地域を選択しないと出品できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include"Shipping area must be other than 1"
   end

  it "発送までの日数を選択しないと出品できない" do 
     @item.shipping_day_id= 1
     @item.valid?
     expect(@item.errors.full_messages).to include"Shipping day must be other than 1"
  end
end

end
