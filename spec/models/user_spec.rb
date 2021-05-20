require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include"Nickname can't be blank"
    end

    it "emailが空と登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include"Email can't be blank"
    end

    it "emailが既に登録されている場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include"Email has already been taken"
    end

    it "emailに＠が含まれていないと登録できない" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include"Email is invalid"
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "last_name_kanaが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_nameが半角だと登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it "last_nameが半角だと登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end

    it "first_name_kanaが全角カタカナ以外だと登録できない" do
      @user.first_name_kana = "てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it "last_name_kanaが全角カタカナ以外だと登録できない" do
      @user.last_name_kana = "てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "passwordが英語のみだと登録できないこと" do
      @user.password = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "passwordが数字のみだと登録できないこと" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

      it "passwordが全角だと登録できないこと" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
    
  end
end
