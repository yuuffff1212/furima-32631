require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性でないと保存できないこと' do
      @user.save 
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@がないと保存できないこと'do
    @user.email = "test00"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空でpassword_confirmationの値が同じでないと保存できないこと' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以内だと保存できないこと'do
    @user.password = "11111"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英数字混合でないと保存できないこと' do
    @user.password = "111111"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid. Include both letters and numbers. Input half-width characters.")
    end
    it 'passwordはすべて英字では保存できないこと' do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid. Include both letters and numbers. Input half-width characters.")
    end
    it 'passwordは全角では保存できないこと' do
      @user.password = 'ＡＡＡＡＡ1'
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid. Include both letters and numbers. Input half-width characters.")
    end
    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = "hayasi"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'last_name_kanaが空だと保存できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空だと保存できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが全角カタカナでないと保存できないこと' do
      @user.last_name_kana = "林"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it 'first_name_kanaが全角カタカナでないと保存できないこと' do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it 'birthdayが空だと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
