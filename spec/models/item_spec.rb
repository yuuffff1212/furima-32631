require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと保存できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと'do
        @item.price = "３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  is invalid. Input half-width alphanumeric characters.")
      end
      it 'priceが半角英数混合では保存できないこと' do
        @item.price= "1a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  is invalid. Input half-width alphanumeric characters.")
      end
      it 'priceが半角英語だと保存できないこと' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  is invalid. Input half-width alphanumeric characters.")
      end
      it 'priceが300円未満だと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが9999999円以上だと保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'shipping_region_idが空だと保存できないこと' do
        @item.shipping_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank", "Shipping region is not a number")
      end
      it 'shipping_region_idの値が0だと保存できないこと' do
        @item.shipping_region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region must be other than 0")
      end
      it 'shipping_date_idが空だと保存できないこと' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
      end
      it 'shipping_date_idの値が0以外でないと保存できないこと' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end
      it 'shipping_cost_idが空だと保存できないこと' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
      end
      it 'shippng_cost_idの値が0以外でないと保存できないこと' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
      end
      it 'item_category_idが空だと保存できないこと' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category is not a number")
      end
      it 'item_category_idの値が0だと保存できないこと' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 0")
      end
      it 'item_state_idが空だと保存できないこと' do
        @item.item_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank", "Item state is not a number")
      end
      it 'item_state_idの値が0だと保存できないこと' do
        @item.item_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 0")
      end
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end

  end

end
