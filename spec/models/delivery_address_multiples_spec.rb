require 'rails_helper'

RSpec.describe DeliveryAddressMultiples, type: :model do
  # zpending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @delivery_address_multiples = FactoryBot.build(:delivery_address_multiples, item_id: @item.id, user_id: @user.id)
  end

  context '内容に問題ない場合' do
    it "入力に問題がなければ保存ができること" do
      expect(@delivery_address_multiples).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "postal_codeが空では保存ができないこと" do
      @delivery_address_multiples.postal_code = nil
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeが「3桁ハイフン4桁」の半角文字列以外では保存ができないこと" do
      @delivery_address_multiples.postal_code = '123-123'
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "address_prefecture_idが空では保存ができないこと" do
      @delivery_address_multiples.address_prefecture_id = 1
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Address prefecture can't be blank")
    end
    it "address_municipalityが空では保存ができないこと" do
      @delivery_address_multiples.address_municipality = nil
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Address municipality can't be blank")
    end
    it "address_blockが空では保存ができないこと" do
      @delivery_address_multiples.address_block = nil
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Address block can't be blank")
    end
    it "telephone_numberが空では保存ができないこと" do
      @delivery_address_multiples.telephone_number  = nil
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Telephone number can't be blank")
    end
    it "telephone_numberが9桁以下では保存ができないこと" do
      @delivery_address_multiples.telephone_number  = '090123456'
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Telephone number is invalid")
    end
    it "telephone_numberが12桁以上では保存ができないこと" do
      @delivery_address_multiples.telephone_number  = '090123456789'
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Telephone number is invalid")
    end
    it "telephone_numberが半角数値でないと保存ができないこと" do
      @delivery_address_multiples.telephone_number  = '0901234567８'
      @delivery_address_multiples.valid?
      expect(@delivery_address_multiples.errors.full_messages).to include("Telephone number is invalid")
    end
  end
end
