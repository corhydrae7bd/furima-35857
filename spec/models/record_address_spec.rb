require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id )
  end

  context '内容に問題ない場合' do
    it '購入情報、配送先、tokenの全てがあれば保存ができる' do
      expect(@record_address).to be_valid
    end

    it 'building_nameが空であっても登録できる' do
      @record_address.building_name = ''
      expect(@record_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では登録できない' do
      @record_address.token = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では登録できない' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeがハイフンを含んだ正しい形式でないと保存できない' do
      @record_address.postal_code = '1234567'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it 'postal_codeが半角でないと保存できない' do
      @record_address.postal_code = '１２３-４５６７'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it 'prefecture_idが1の時は出品できない' do
      @record_address.prefecture_id = 1
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では登録できない' do
      @record_address.city = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空では登録できない' do
      @record_address.house_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空では登録できない' do
      @record_address.phone_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが半角でないと登録できない' do
      @record_address.phone_number = '０９０１２３４５６７８'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが10字、または11字でないと登録できない' do
      @record_address.phone_number = '090123'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'userが紐付いていないと保存できない' do
      @record_address.user_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できない' do
      @record_address.item_id = nil
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
