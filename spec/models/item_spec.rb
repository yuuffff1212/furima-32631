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
      it 'shipping_region_idが空だと保存できないこと' do
        @item.shipping_region = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank", "Shipping region is not a number")
      end
      it 'shipping_date_idが空だと保存できないこと' do
        @item.shipping_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
      end
      it 'shipping_cost_idが空だと保存できないこと' do
        @item.shipping_cost = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
      end
      it 'item_category_idが空だと保存できないこと' do
        @item.item_category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category is not a number")
      end
      it 'item_state_idが空だと保存できないこと' do
        @item.item_state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank", "Item state is not a number")
      end
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end

  end

end
