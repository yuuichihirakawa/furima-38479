require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '正常に出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像をつけないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'product_descriptionが空では出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'item_category_idが空では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_state_idが空では出品できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it 'delivery_charge_burden_idが空では出品できない' do
        @item.delivery_charge_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
      end
      it 'address_prefecture_idが空では出品できない' do
        @item.address_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Address prefecture can't be blank")
      end
      it 'days_up_to_delivery_idが空では出品できない' do
        @item.days_up_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days up to delivery can't be blank")
      end
      it 'item_priceが空では出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '販売価格が、¥300より少ない金額では出品できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は、¥300から¥9999999の範囲内で設定してください")
      end
      it '販売価格が、¥9999999より多い金額では出品できない' do
        @item.item_price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は、¥300から¥9999999の範囲内で設定してください")
      end
      it 'item_priceが全角では出品できない' do
        @item.item_price = '２００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は半角数字のみを使用してください")
      end
      it 'item_priceが英字では出品できない' do
        @item.item_price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は半角数字のみを使用してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
