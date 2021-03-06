require 'rails_helper'

RSpec.describe UserCustomer, type: :model do
  before do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_customer = FactoryBot.build(:user_customer, user_id: @user.id, item_id: @item.id)
    sleep 0.1 # 0.1秒待機
  end

  describe '住所登録機能' do
    context '住所が登録できるとき' do
      it 'すべての値が正しく入力できれば保存できる' do
        expect(@user_customer).to be_valid
      end
      it '建物名が空でも登録できること' do
        @user_customer.building_number = nil
        expect(@user_customer).to be_valid
      end
    end

    context '住所が登録できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_customer.postal_code = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Postal code can't be blank")
      end
      it  'postal_codeにハイフンがないと保存できないこと' do
        @user_customer.postal_code = "1570077"
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it  'cityが空だと保存できないこと' do
        @user_customer.city = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("City can't be blank")
      end
      it  'house_numberが空だと保存できないこと' do
        @user_customer.house_number = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("House number can't be blank")
      end
      it  'tellが空だと保存できないこと' do
        @user_customer.tell = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Tell can't be blank", "Tell only input number.Tell is too long (maximum is 11 characters) ")
      end
      it  'tellにハイフンがあると保存できないこと' do
        @user_customer.tell = "080-3709-5444"
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Tell only input number.Tell is too long (maximum is 11 characters) ")
      end
      it 'tellが半角英数混合だと保存できないこと' do
        @user_customer.tell = "1a"
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Tell only input number.Tell is too long (maximum is 11 characters) ")
      end
      it  'tellが11行以上だと保存できないこと' do
        @user_customer.tell = "080123456789"
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Tell only input number.Tell is too long (maximum is 11 characters) ")
      end
      it  'shipping_region_idが空だと保存できないこと' do
        @user_customer.shipping_region_id = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Shipping region can't be blank")
      end
      it  'shipping_region_idが0だと保存できないこと' do
        @user_customer.shipping_region_id = 0
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Shipping region must be other than 0")
      end
      it  'user_idが空だと保存できないこと' do
        @user_customer.user_id = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("User can't be blank")
      end
      it  'item_idが空だと保存できないこと' do
        @user_customer.item_id = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @user_customer.token = nil
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
