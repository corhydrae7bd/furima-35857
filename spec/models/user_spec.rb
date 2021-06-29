require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailは、@を含まないと登録できない' do
      @user.email = "testgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英字のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordが半角数字のみでは登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordが全角では登録できない' do
      @user.password = "１２３ａｂｃ"
      @user.password_confirmation = "１２３ａｂｃ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordとpassword_confirmationは、値の一致しないと登録できない' do
      @user.password = "123abc"
      @user.password_confirmation = "456dfg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameは、空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameは、空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_readingは、空では登録できない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it 'first_name_readingは、空では登録できない' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

    it 'last_nameは、全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end

    it 'last_name_readingは、全角（カタカナ）での入力しないと登録できない' do
      @user.last_name_reading = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
    end

    it 'first_name_readingは、全角（カタカナ）での入力しないと登録できない' do
      @user.first_name_reading = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
    end

    it 'birthdayが必須である' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
